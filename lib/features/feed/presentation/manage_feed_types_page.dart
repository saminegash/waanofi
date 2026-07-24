import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/waanofi_colors.dart';
import 'package:waanofi/l10n/app_localizations.dart';
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

    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.addFeedType),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: l10n.feedName),
                validator: (v) => v!.isEmpty ? l10n.required : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _unitController,
                decoration: InputDecoration(labelText: l10n.unit),
                validator: (v) => v!.isEmpty ? l10n.required : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _costController,
                decoration: InputDecoration(labelText: l10n.costPerUnit),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (v) {
                  if (v == null || v.isEmpty) return l10n.required;
                  if (double.tryParse(v) == null) return l10n.mustBeNumber;
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final feedType = FeedTypeModel(
                  id: '',
                  farmId: '',
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
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(feedTypesControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.manageFeedTypes),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
      body: state.when(
        data: (feedTypes) {
          if (feedTypes.isEmpty) {
            return Center(child: Text(l10n.noFeedTypesConfigured));
          }
          return ListView.builder(
            itemCount: feedTypes.length,
            itemBuilder: (context, index) {
              final type = feedTypes[index];
              return ListTile(
                title: Text(type.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${l10n.unit.split(' ')[0]}: ${type.unit}'),
                trailing: Text('\$${type.unitCost.toStringAsFixed(2)} / ${type.unit}', 
                  style: const TextStyle(color: WaanofiColors.primary, fontWeight: FontWeight.w600)),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('${l10n.error}: $e')),
      ),
    );
  }
}
