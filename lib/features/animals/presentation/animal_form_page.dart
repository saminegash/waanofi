import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/auth/app_user.dart';
import '../../../core/auth/app_user.dart';
import '../../../core/auth/auth_providers.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../data/animals_repository.dart';
import '../domain/animal_model.dart';
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
  
  bool _loading = false;
  AnimalModel? _existing;

  @override
  void initState() {
    super.initState();
    if (widget.animalId != null) {
      // Need to defer reading provider
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final animals = ref.read(animalsControllerProvider).valueOrNull ?? [];
        _existing = animals.where((a) => a.id == widget.animalId).firstOrNull;
        if (_existing != null) {
          _tagController.text = _existing!.tagNumber;
          _nameController.text = _existing!.name ?? '';
          _breedController.text = _existing!.breed ?? '';
          setState(() {
            _sex = _existing!.sex;
            _status = _existing!.status;
            _dob = _existing!.dob;
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
        id: _existing?.id ?? const Uuid().v4(), // Generate local UUID
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

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Animal' : 'New Animal'),
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
                decoration: const InputDecoration(labelText: 'Tag Number *'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name (Optional)'),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _breedController,
                decoration: const InputDecoration(labelText: 'Breed (Optional)'),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _sex,
                decoration: const InputDecoration(labelText: 'Sex *'),
                items: const [
                  DropdownMenuItem(value: 'female', child: Text('Female')),
                  DropdownMenuItem(value: 'male', child: Text('Male')),
                ],
                onChanged: (v) => setState(() => _sex = v!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _status,
                decoration: const InputDecoration(labelText: 'Status *'),
                items: const [
                  DropdownMenuItem(value: 'active', child: Text('Active')),
                  DropdownMenuItem(value: 'dry', child: Text('Dry')),
                  DropdownMenuItem(value: 'pregnant', child: Text('Pregnant')),
                  DropdownMenuItem(value: 'sick', child: Text('Sick')),
                  DropdownMenuItem(value: 'sold', child: Text('Sold')),
                  DropdownMenuItem(value: 'deceased', child: Text('Deceased')),
                ],
                onChanged: (v) => setState(() => _status = v!),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(_dob == null 
                    ? 'Select Date of Birth (Optional)' 
                    : 'DOB: ${_dob.toString().split(' ')[0]}'),
                trailing: const Icon(Icons.calendar_today),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: WaanofiColors.textSecondary),
                  borderRadius: BorderRadius.circular(4),
                ),
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
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)) 
                      : const Text('Save Animal'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
