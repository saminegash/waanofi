import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/auth/permission.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../../../shared/widgets/role_guard.dart';
import 'controllers/feed_entry_controller.dart';
import 'controllers/feed_types_controller.dart';
import '../../analytics/presentation/controllers/dashboard_controller.dart';
import 'package:waanofi/l10n/app_localizations.dart';

class DailyFeedEntryPage extends ConsumerWidget {
  const DailyFeedEntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(feedEntryControllerProvider);
    final controller = ref.read(feedEntryControllerProvider.notifier);
    final feedTypesState = ref.watch(feedTypesControllerProvider);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.recordFeed),
      ),
      body: Column(
        children: [
          _buildHeader(context, state, controller, feedTypesState),
          const Divider(height: 1),
          Expanded(child: _buildBody(context, state, controller)),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: (state.selectedFeedType == null || state.totalQuantity == 0)
                ? null
                : () async {
                    await controller.submit();
                    ref.invalidate(dashboardControllerProvider);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.feedRecordedSecurely)),
                      );
                      if (context.canPop()) context.pop();
                    }
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                '${l10n.saveFeed} (${state.totalQuantity.toStringAsFixed(1)} ${state.selectedFeedType?.unit ?? ""})',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, FeedEntryState state,
      FeedEntryController controller, AsyncValue feedTypesState) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      color: WaanofiColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: state.selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) controller.updateDate(date);
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: l10n.date,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DateFormat('MMM dd, yyyy').format(state.selectedDate)),
                        const Icon(Icons.calendar_today, size: 20),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: feedTypesState.when(
                  data: (feedTypes) {
                    if (feedTypes.isEmpty) {
                      return Text(l10n.noActiveFeedTypes, style: const TextStyle(color: WaanofiColors.error));
                    }
                    return DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: l10n.feedType,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      value: state.selectedFeedType,
                      items: feedTypes.map<DropdownMenuItem>((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) controller.updateFeedType(val);
                      },
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (e, _) => Text('Err: $e'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Toggle between Farm-wide and Per-Animal
          SegmentedButton<bool>(
            segments: [
              ButtonSegment(value: true, label: Text(l10n.farmWideEntry)),
              ButtonSegment(value: false, label: Text(l10n.perAnimalEntry)),
            ],
            selected: {state.isFarmWide},
            onSelectionChanged: (set) {
              controller.toggleEntryType(set.first);
            },
            style: SegmentedButton.styleFrom(
              selectedBackgroundColor: WaanofiColors.primary.withOpacity(0.2),
            ),
          ),
          
          // RoleGuard for displaying calculated cost
          const SizedBox(height: 16),
          RoleGuard(
            permission: Permission.viewFinance, // Only admins/finance can see cost
            fallback: const SizedBox.shrink(),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: WaanofiColors.surfaceDark,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.estimatedCost, style: const TextStyle(color: WaanofiColors.textSecondary)),
                  Text('\$${state.totalCost.toStringAsFixed(2)}', 
                    style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.primary)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(
      BuildContext context, FeedEntryState state, FeedEntryController controller) {
    final l10n = AppLocalizations.of(context)!;
    if (state.selectedFeedType == null) {
      return Center(
        child: Text(l10n.selectFeedTypeFirst, style: const TextStyle(fontSize: 16, color: WaanofiColors.textSecondary)),
      );
    }

    if (state.isFarmWide) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.agriculture, size: 64, color: WaanofiColors.textSecondary),
              const SizedBox(height: 24),
              Text(l10n.enterTotalQuantity,
                  textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              SizedBox(
                width: 200,
                child: TextFormField(
                  initialValue: state.farmWideQuantity > 0 ? state.farmWideQuantity.toString() : '',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    suffixText: state.selectedFeedType!.unit,
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (v) {
                    final val = double.tryParse(v) ?? 0.0;
                    controller.updateFarmWideQuantity(val);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Per Animal List
    if (state.activeAnimals.isEmpty) {
      return Center(child: Text(l10n.noActiveAnimals));
    }

    return ListView.builder(
      itemCount: state.activeAnimals.length,
      itemBuilder: (context, index) {
        final animal = state.activeAnimals[index];
        final val = state.animalQuantities[animal.id] ?? 0.0;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: WaanofiColors.primary.withOpacity(0.1),
              child: const Icon(Icons.pets, color: WaanofiColors.primary),
            ),
            title: Text(animal.tagNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: animal.name != null ? Text(animal.name!) : null,
            trailing: SizedBox(
              width: 120,
              child: TextFormField(
                initialValue: val > 0 ? val.toString() : '',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  suffixText: state.selectedFeedType!.unit,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (v) {
                  final parsed = double.tryParse(v) ?? 0.0;
                  controller.updateAnimalQuantity(animal.id, parsed);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
