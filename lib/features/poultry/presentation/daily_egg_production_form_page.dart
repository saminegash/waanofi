import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../../../core/auth/auth_providers.dart';
import '../data/flock_repository.dart';
import '../data/egg_production_repository.dart';
import '../domain/flock_model.dart';
import '../domain/egg_production_record_model.dart';

class DailyEggProductionFormPage extends ConsumerStatefulWidget {
  const DailyEggProductionFormPage({super.key});

  @override
  ConsumerState<DailyEggProductionFormPage> createState() => _DailyEggProductionFormPageState();
}

class _DailyEggProductionFormPageState extends ConsumerState<DailyEggProductionFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedFlockId;
  DateTime _productionDate = DateTime.now();

  final _goodController = TextEditingController();
  final _crackedController = TextEditingController(text: '0');
  final _rejectedController = TextEditingController(text: '0');
  final _farmUseController = TextEditingController(text: '0');
  final _soldDirectlyController = TextEditingController(text: '0');

  int _computedAvailable = 0;
  int _trays = 0;
  int _loose = 0;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _goodController.addListener(_recompute);
    _farmUseController.addListener(_recompute);
    _soldDirectlyController.addListener(_recompute);
  }

  void _recompute() {
    final good = int.tryParse(_goodController.text) ?? 0;
    final farmUse = int.tryParse(_farmUseController.text) ?? 0;
    final sold = int.tryParse(_soldDirectlyController.text) ?? 0;
    
    final avail = good - (farmUse + sold);
    setState(() {
      _computedAvailable = avail;
      if (_computedAvailable > 0) {
        _trays = _computedAvailable ~/ 30;
        _loose = _computedAvailable % 30;
      } else {
        _trays = 0;
        _loose = 0;
      }
    });
  }

  @override
  void dispose() {
    _goodController.dispose();
    _crackedController.dispose();
    _rejectedController.dispose();
    _farmUseController.dispose();
    _soldDirectlyController.dispose();
    super.dispose();
  }

  void _save(AppLocalizations l10n) async {
    if (_selectedFlockId == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.pleaseSelectFlock)));
      return;
    }
    if (!_formKey.currentState!.validate()) return;

    final good = int.tryParse(_goodController.text) ?? 0;
    final cracked = int.tryParse(_crackedController.text) ?? 0;
    final rejected = int.tryParse(_rejectedController.text) ?? 0;
    final farmUse = int.tryParse(_farmUseController.text) ?? 0;
    final soldDirectly = int.tryParse(_soldDirectlyController.text) ?? 0;

    if (_computedAvailable < 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.allocationExceedsCollectedError)));
      return;
    }

    setState(() => _isSaving = true);
    try {
      final user = ref.read(currentUserProvider);
      final record = EggProductionRecordModel(
        id: const Uuid().v4(),
        farmId: user?.farmId ?? '',
        flockId: _selectedFlockId!,
        productionDate: _productionDate,
        goodEggs: good,
        crackedEggs: cracked,
        rejectedEggs: rejected,
        farmUseEggs: farmUse,
        soldDirectlyEggs: soldDirectly,
        availableEggs: _computedAvailable,
        recordedBy: user?.id,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      record.validate();
      await ref.read(eggProductionRepositoryProvider).saveRecord(record);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.eggRecordSaved)));
        context.pop();
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final flocksStream = ref.watch(flockRepositoryProvider).watchFlocks();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.recordDailyEggs),
        backgroundColor: WaanofiColors.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<List<FlockModel>>(
                stream: flocksStream,
                builder: (context, snapshot) {
                  final flocks = (snapshot.data ?? []).where((f) => f.isActive).toList();
                  return DropdownButtonFormField<String>(
                    value: _selectedFlockId,
                    decoration: InputDecoration(
                      labelText: l10n.selectFlock,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      fillColor: WaanofiColors.surface,
                      filled: true,
                    ),
                    items: flocks.map((f) => DropdownMenuItem(value: f.id, child: Text('${f.name} (${f.flockCode})'))).toList(),
                    onChanged: (val) => setState(() => _selectedFlockId = val),
                    validator: (val) => val == null ? l10n.pleaseSelectFlock : null,
                  );
                },
              ),
              const SizedBox(height: 16),
              InputDecorator(
                decoration: InputDecoration(
                  labelText: l10n.productionDate,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  fillColor: WaanofiColors.surface,
                  filled: true,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${_productionDate.year}-${_productionDate.month}-${_productionDate.day}', style: const TextStyle(fontSize: 16, color: WaanofiColors.textPrimary)),
                    IconButton(
                      icon: const Icon(Icons.calendar_today, color: WaanofiColors.primary),
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _productionDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) setState(() => _productionDate = picked);
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(l10n.collectedEggs, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.textPrimary)),
              const SizedBox(height: 12),
              _buildNumberField(l10n.goodEggs, _goodController, autofocus: true),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildNumberField(l10n.crackedEggs, _crackedController)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildNumberField(l10n.rejectedEggs, _rejectedController)),
                ],
              ),
              const SizedBox(height: 24),
              Text(l10n.eggAllocations, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.textPrimary)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildNumberField(l10n.farmUseEggs, _farmUseController)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildNumberField(l10n.soldDirectlyEggs, _soldDirectlyController)),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: WaanofiColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: _computedAvailable < 0 ? WaanofiColors.error : WaanofiColors.primary, width: 2),
                ),
                child: Column(
                  children: [
                    Text(l10n.availableForSale, style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 14)),
                    const SizedBox(height: 8),
                    Text(
                      '$_computedAvailable',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: _computedAvailable < 0 ? WaanofiColors.error : WaanofiColors.primary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$_trays ${l10n.fullTrays} (30 ${l10n.eggsPerTray}) + $_loose ${l10n.looseEggs}',
                      style: const TextStyle(color: WaanofiColors.secondary, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : () => _save(l10n),
                  style: ElevatedButton.styleFrom(backgroundColor: WaanofiColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: _isSaving ? const CircularProgressIndicator(color: WaanofiColors.surface) : Text(l10n.saveRecord, style: const TextStyle(color: WaanofiColors.surface, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberField(String label, TextEditingController controller, {bool autofocus = false}) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        fillColor: WaanofiColors.surface,
        filled: true,
      ),
      validator: (val) {
        final num = int.tryParse(val ?? '') ?? -1;
        if (num < 0) return 'Must be >= 0';
        return null;
      },
    );
  }
}
