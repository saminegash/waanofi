import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/auth/permission.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../../../shared/widgets/role_guard.dart';
import '../domain/egg_record_model.dart';
import 'controllers/egg_entry_controller.dart';

class DailyEggEntryPage extends ConsumerWidget {
  const DailyEggEntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eggEntryControllerProvider);
    final controller = ref.read(eggEntryControllerProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.recordEggs),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Date Picker
            InkWell(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: state.date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (date != null) controller.setDate(date);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: l10n.date,
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
                child: Text(state.date.toString().split(' ')[0]),
              ),
            ),
            const SizedBox(height: 16),

            // Flock Name
            TextFormField(
              decoration: InputDecoration(
                labelText: l10n.flockName,
                hintText: l10n.flockNameHint,
                prefixIcon: const Icon(Icons.home_work_outlined),
              ),
              onChanged: controller.setFlockName,
            ),
            const SizedBox(height: 16),

            // Production Type
            DropdownButtonFormField<EggProductionType>(
              value: state.productionType,
              decoration: InputDecoration(
                labelText: l10n.productionType,
                prefixIcon: const Icon(Icons.eco_outlined),
              ),
              items: EggProductionType.values.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(_productionTypeLabel(type, l10n)),
                );
              }).toList(),
              onChanged: (type) {
                if (type != null) controller.setProductionType(type);
              },
            ),
            const SizedBox(height: 16),

            // Quantity
            TextFormField(
              decoration: InputDecoration(
                labelText: l10n.eggQuantity,
                hintText: '0',
                prefixIcon: const Icon(Icons.egg_outlined),
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                controller.setQuantity(int.tryParse(val));
              },
            ),
            const SizedBox(height: 16),

            // Broken Count
            TextFormField(
              decoration: InputDecoration(
                labelText: l10n.brokenCount,
                hintText: '0',
                prefixIcon: const Icon(Icons.broken_image_outlined),
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                controller.setBrokenCount(int.tryParse(val) ?? 0);
              },
            ),
            const SizedBox(height: 16),

            // Good Eggs Summary
            if (state.quantity != null)
              Card(
                color: WaanofiColors.primaryLight.withValues(alpha: 0.1),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatChip(
                        icon: Icons.egg,
                        label: l10n.totalEggs,
                        value: '${state.quantity}',
                        color: WaanofiColors.primary,
                      ),
                      _StatChip(
                        icon: Icons.check_circle,
                        label: l10n.goodEggs,
                        value: '${state.goodEggs}',
                        color: WaanofiColors.success,
                      ),
                      _StatChip(
                        icon: Icons.broken_image,
                        label: l10n.broken,
                        value: '${state.brokenCount}',
                        color: WaanofiColors.error,
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),

            // Notes
            TextFormField(
              decoration: InputDecoration(
                labelText: l10n.notesOptional,
                prefixIcon: const Icon(Icons.notes),
              ),
              maxLines: 3,
              onChanged: (val) {
                controller.setNotes(val.isEmpty ? null : val);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: RoleGuard(
        permission: Permission.recordEggs,
        fallback: const SizedBox.shrink(),
        child: FloatingActionButton.extended(
          onPressed: state.isLoading
              ? null
              : () async {
                  try {
                    await controller.saveRecord();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.savedLocally),
                          backgroundColor: WaanofiColors.success,
                        ),
                      );
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/');
                      }
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                          backgroundColor: WaanofiColors.error,
                        ),
                      );
                    }
                  }
                },
          icon: state.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.save),
          label: Text(state.isLoading ? l10n.saving : l10n.save),
        ),
      ),
    );
  }

  String _productionTypeLabel(EggProductionType type, AppLocalizations l10n) {
    switch (type) {
      case EggProductionType.freeRange:
        return l10n.freeRange;
      case EggProductionType.caged:
        return l10n.caged;
      case EggProductionType.organic:
        return l10n.organic;
    }
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 11, color: WaanofiColors.textSecondary)),
      ],
    );
  }
}
