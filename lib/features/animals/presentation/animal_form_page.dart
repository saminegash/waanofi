import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/theme/waanofi_colors.dart';
import 'package:waanofi/l10n/app_localizations.dart';
import '../data/animals_repository.dart';
import '../domain/animal_enums.dart';
import '../domain/animal_model.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../analytics/presentation/controllers/dashboard_controller.dart';
import 'controllers/animals_controller.dart';

class AnimalFormPage extends ConsumerStatefulWidget {
  const AnimalFormPage({super.key, this.animalId});

  final String? animalId;

  @override
  ConsumerState<AnimalFormPage> createState() => _AnimalFormPageState();
}

class _AnimalFormPageState extends ConsumerState<AnimalFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _tagController = TextEditingController();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _locationController = TextEditingController();
  
  String _sex = 'female';
  CattleClass _cattleClass = CattleClass.cow;
  AnimalLifecycleStatus _lifecycleStatus = AnimalLifecycleStatus.active;
  AnimalReproductiveStatus _reproductiveStatus = AnimalReproductiveStatus.open;
  AnimalLactationStatus _lactationStatus = AnimalLactationStatus.lactating;
  AnimalHealthStatus _healthStatus = AnimalHealthStatus.healthy;
  
  DateTime? _dob;
  AnimalModel? _existing;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    if (widget.animalId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final animals = ref.read(animalsControllerProvider).valueOrNull ?? [];
        final match = animals.where((a) => a.id == widget.animalId).firstOrNull;
        if (match != null) {
          setState(() {
            _existing = match;
            _tagController.text = match.tagNumber;
            _nameController.text = match.name ?? '';
            _breedController.text = match.breed ?? '';
            _locationController.text = match.location ?? '';
            _sex = match.sex.toLowerCase();
            _cattleClass = match.cattleClass;
            _lifecycleStatus = match.lifecycleStatus;
            _reproductiveStatus = match.reproductiveStatus;
            _lactationStatus = match.lactationStatus;
            _healthStatus = match.healthStatus;
            _dob = match.dob;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _tagController.dispose();
    _nameController.dispose();
    _breedController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _onSexChanged(String? newSex) {
    if (newSex == null) return;
    setState(() {
      _sex = newSex;
      if (_sex == 'male') {
        _reproductiveStatus = AnimalReproductiveStatus.notApplicable;
        _lactationStatus = AnimalLactationStatus.notApplicable;
        if (_cattleClass == CattleClass.cow || _cattleClass == CattleClass.heifer) {
          _cattleClass = CattleClass.bull;
        }
      } else {
        if (_reproductiveStatus == AnimalReproductiveStatus.notApplicable) {
          _reproductiveStatus = AnimalReproductiveStatus.open;
        }
        if (_lactationStatus == AnimalLactationStatus.notApplicable) {
          _lactationStatus = AnimalLactationStatus.lactating;
        }
        if (_cattleClass == CattleClass.bull || _cattleClass == CattleClass.steer) {
          _cattleClass = CattleClass.cow;
        }
      }
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    
    final user = ref.read(currentUserProvider);
    if (user?.farmId == null) return;

    setState(() => _loading = true);

    try {
      final repo = ref.read(animalsRepositoryProvider);
      
      final animal = AnimalModel(
        id: _existing?.id ?? const Uuid().v4(),
        farmId: _existing?.farmId ?? user!.farmId!,
        tagNumber: _tagController.text.trim(),
        name: _nameController.text.trim().isEmpty ? null : _nameController.text.trim(),
        breed: _breedController.text.trim().isEmpty ? null : _breedController.text.trim(),
        location: _locationController.text.trim().isEmpty ? null : _locationController.text.trim(),
        sex: _sex,
        cattleClass: _cattleClass,
        lifecycleStatus: _lifecycleStatus,
        reproductiveStatus: _reproductiveStatus,
        lactationStatus: _lactationStatus,
        healthStatus: _healthStatus,
        dob: _dob,
        createdAt: _existing?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await repo.saveAnimal(animal);
      ref.invalidate(dashboardControllerProvider);
      
      if (mounted) {
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: WaanofiColors.error),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.animalId != null;
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMale = _sex == 'male';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(isEditing ? l10n.editAnimal : l10n.newAnimal),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [const Color(0xFF1E293B), const Color(0xFF0F172A)]
                : [WaanofiColors.primary.withValues(alpha: 0.1), WaanofiColors.primary.withValues(alpha: 0.02)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 100, bottom: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Identification Section
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.info,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.primary),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _tagController,
                        decoration: InputDecoration(labelText: l10n.tagNumber),
                        validator: (v) => v == null || v.trim().isEmpty ? l10n.required : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: l10n.nameOptional),
                        textCapitalization: TextCapitalization.words,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _breedController,
                        decoration: InputDecoration(labelText: l10n.breedOptional),
                        textCapitalization: TextCapitalization.words,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _locationController,
                        decoration: InputDecoration(
                          labelText: l10n.locationOptional,
                          prefixIcon: const Icon(Icons.location_on_outlined),
                        ),
                        textCapitalization: TextCapitalization.words,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 2. Biology & Classification Section
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.cattleClass,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.primary),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: _sex,
                        decoration: InputDecoration(labelText: l10n.sex),
                        items: const [
                          DropdownMenuItem(value: 'female', child: Text('Female')),
                          DropdownMenuItem(value: 'male', child: Text('Male')),
                        ],
                        onChanged: _onSexChanged,
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<CattleClass>(
                        value: _cattleClass,
                        decoration: InputDecoration(labelText: l10n.cattleClass),
                        items: (isMale
                                ? [CattleClass.bull, CattleClass.steer, CattleClass.calf, CattleClass.unknown]
                                : [CattleClass.cow, CattleClass.heifer, CattleClass.calf, CattleClass.unknown])
                            .map((c) => DropdownMenuItem(
                                  value: c,
                                  child: Text(_cattleClassLabel(c, l10n)),
                                ))
                            .toList(),
                        onChanged: (v) {
                          if (v != null) setState(() => _cattleClass = v);
                        },
                      ),
                      const SizedBox(height: 12),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(l10n.dateOfBirth),
                        subtitle: Text(_dob?.toString().split(' ')[0] ?? l10n.selectDate),
                        trailing: const Icon(Icons.calendar_today),
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: _dob ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) setState(() => _dob = date);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 3. Status Dimensions Section
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.status,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.primary),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<AnimalLifecycleStatus>(
                        value: _lifecycleStatus,
                        decoration: InputDecoration(labelText: l10n.lifecycleStatus),
                        items: AnimalLifecycleStatus.values
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(_lifecycleLabel(s, l10n)),
                                ))
                            .toList(),
                        onChanged: (v) {
                          if (v != null) setState(() => _lifecycleStatus = v);
                        },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<AnimalReproductiveStatus>(
                        value: _reproductiveStatus,
                        decoration: InputDecoration(labelText: l10n.reproductiveStatus),
                        items: (isMale
                                ? [AnimalReproductiveStatus.notApplicable]
                                : AnimalReproductiveStatus.values)
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(_reproductiveLabel(s, l10n)),
                                ))
                            .toList(),
                        onChanged: isMale
                            ? null
                            : (v) {
                                if (v != null) setState(() => _reproductiveStatus = v);
                              },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<AnimalLactationStatus>(
                        value: _lactationStatus,
                        decoration: InputDecoration(labelText: l10n.lactationStatus),
                        items: (isMale
                                ? [AnimalLactationStatus.notApplicable]
                                : AnimalLactationStatus.values)
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(_lactationLabel(s, l10n)),
                                ))
                            .toList(),
                        onChanged: isMale
                            ? null
                            : (v) {
                                if (v != null) setState(() => _lactationStatus = v);
                              },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<AnimalHealthStatus>(
                        value: _healthStatus,
                        decoration: InputDecoration(labelText: l10n.healthStatus),
                        items: AnimalHealthStatus.values
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(_healthLabel(s, l10n)),
                                ))
                            .toList(),
                        onChanged: (v) {
                          if (v != null) setState(() => _healthStatus = v);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _save,
                    child: _loading
                        ? const CircularProgressIndicator()
                        : Text(l10n.save),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _lifecycleLabel(AnimalLifecycleStatus s, AppLocalizations l10n) {
    switch (s) {
      case AnimalLifecycleStatus.active:
        return l10n.active;
      case AnimalLifecycleStatus.sold:
        return l10n.sold;
      case AnimalLifecycleStatus.transferredOut:
        return l10n.transferredOut;
      case AnimalLifecycleStatus.deceased:
        return l10n.deceased;
      case AnimalLifecycleStatus.culled:
        return l10n.culled;
      case AnimalLifecycleStatus.missing:
        return l10n.missing;
      case AnimalLifecycleStatus.unknown:
        return l10n.unknown;
    }
  }

  String _reproductiveLabel(AnimalReproductiveStatus s, AppLocalizations l10n) {
    switch (s) {
      case AnimalReproductiveStatus.notApplicable:
        return l10n.notApplicable;
      case AnimalReproductiveStatus.open:
        return l10n.open;
      case AnimalReproductiveStatus.heat:
        return l10n.heat;
      case AnimalReproductiveStatus.served:
        return l10n.served;
      case AnimalReproductiveStatus.pregnant:
        return l10n.pregnant;
      case AnimalReproductiveStatus.postpartum:
        return l10n.postpartum;
      case AnimalReproductiveStatus.unknown:
        return l10n.unknown;
    }
  }

  String _lactationLabel(AnimalLactationStatus s, AppLocalizations l10n) {
    switch (s) {
      case AnimalLactationStatus.notApplicable:
        return l10n.notApplicable;
      case AnimalLactationStatus.lactating:
        return l10n.lactating;
      case AnimalLactationStatus.dry:
        return l10n.dry;
      case AnimalLactationStatus.unknown:
        return l10n.unknown;
    }
  }

  String _healthLabel(AnimalHealthStatus s, AppLocalizations l10n) {
    switch (s) {
      case AnimalHealthStatus.healthy:
        return l10n.healthy;
      case AnimalHealthStatus.sick:
        return l10n.sick;
      case AnimalHealthStatus.underTreatment:
        return l10n.underTreatment;
      case AnimalHealthStatus.quarantined:
        return l10n.quarantined;
      case AnimalHealthStatus.recovering:
        return l10n.recovering;
      case AnimalHealthStatus.unknown:
        return l10n.unknown;
    }
  }

  String _cattleClassLabel(CattleClass c, AppLocalizations l10n) {
    switch (c) {
      case CattleClass.calf:
        return l10n.calf;
      case CattleClass.heifer:
        return l10n.heifer;
      case CattleClass.cow:
        return l10n.cow;
      case CattleClass.bull:
        return l10n.bull;
      case CattleClass.steer:
        return l10n.steer;
      case CattleClass.unknown:
        return l10n.unknown;
    }
  }
}
