import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../domain/feed_type_model.dart';
import 'controllers/feed_types_controller.dart';

class ManageFeedTypesPage extends ConsumerStatefulWidget {
  const ManageFeedTypesPage({super.key});

  @override
  ConsumerState<ManageFeedTypesPage> createState() => _ManageFeedTypesPageState();
}

class _ManageFeedTypesPageState extends ConsumerState<ManageFeedTypesPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _unitController = TextEditingController(text: 'kg');
  final _costController = TextEditingController();

  void _showAddDialog() {
    _nameController.clear();
    _unitController.text = 'kg';
    _costController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Feed Type'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Feed Name (e.g. Alfalfa)'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _unitController,
                decoration: const InputDecoration(labelText: 'Unit (e.g. kg, bales)'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _costController,
                decoration: const InputDecoration(labelText: 'Cost per Unit'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Required';
                  if (double.tryParse(v) == null) return 'Must be a number';
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final feedType = FeedTypeModel(
                  id: '',
                  farmId: '', // Handled by backend or outbox logic usually, but we need it here.
                  name: _nameController.text.trim(),
                  unit: _unitController.text.trim(),
                  unitCost: double.parse(_costController.text),
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                );
                ref.read(feedTypesControllerProvider.notifier).saveFeedType(feedType);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(feedTypesControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Feed Types'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
      body: state.when(
        data: (feedTypes) {
          if (feedTypes.isEmpty) {
            return const Center(child: Text('No feed types configured yet.'));
          }
          return ListView.builder(
            itemCount: feedTypes.length,
            itemBuilder: (context, index) {
              final type = feedTypes[index];
              return ListTile(
                title: Text(type.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Unit: ${type.unit}'),
                trailing: Text('\$${type.unitCost.toStringAsFixed(2)} / ${type.unit}', 
                  style: const TextStyle(color: WaanofiColors.primary, fontWeight: FontWeight.w600)),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
