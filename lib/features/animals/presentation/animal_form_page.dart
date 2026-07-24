import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/auth/app_user.dart';
import '../../../core/auth/auth_providers.dart';
import '../../../core/theme/waanofi_colors.dart';
import 'package:waanofi/l10n/app_localizations.dart';
import '../data/animals_repository.dart';
import '../domain/animal_model.dart';
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
  String _sex = 'female';
  String _status = 'active';
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
            _sex = match.sex;
            _status = match.status;
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
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    
    final user = ref.read(currentUserProvider);
    if (user?.farmId == null) return;

    setState(() => _loading = true);

    try {
      final repo = ref.read(animalsRepositoryProvider);
      
      final animal = AnimalModel(
        id: _existing?.id ?? Uuid().v4(), // Generate local UUID
        farmId: _existing?.farmId ?? user!.farmId!,
        tagNumber: _tagController.text.trim(),
        name: _nameController.text.trim().isEmpty ? null : _nameController.text.trim(),
        breed: _breedController.text.trim().isEmpty ? null : _breedController.text.trim(),
        sex: _sex,
        dob: _dob,
        status: _status,
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

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? l10n.editAnimal : l10n.newAnimal),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _tagController,
                decoration: InputDecoration(labelText: l10n.tagNumber),
                validator: (v) => v == null || v.trim().isEmpty ? l10n.required : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: l10n.nameOptional),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _breedController,
                decoration: InputDecoration(labelText: l10n.breedOptional),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _sex,
                decoration: InputDecoration(labelText: l10n.sex),
                items: const [
                  DropdownMenuItem(value: 'female', child: Text('Female')),
                  DropdownMenuItem(value: 'male', child: Text('Male')),
                ],
                onChanged: (v) => setState(() => _sex = v!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _status,
                decoration: InputDecoration(labelText: l10n.status),
                items: [
                  DropdownMenuItem(value: 'active', child: Text(l10n.active)),
                  DropdownMenuItem(value: 'dry', child: Text(l10n.dry)),
                  DropdownMenuItem(value: 'pregnant', child: Text(l10n.pregnant)),
                  DropdownMenuItem(value: 'sick', child: Text(l10n.sick)),
                  DropdownMenuItem(value: 'sold', child: Text(l10n.sold)),
                  DropdownMenuItem(value: 'deceased', child: Text(l10n.deceased)),
                ],
                onChanged: (v) => setState(() => _status = v!),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 32),
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
    );
  }
}
