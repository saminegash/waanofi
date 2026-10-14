import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/auth/permission.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../../../shared/widgets/role_guard.dart';
import 'package:waanofi/l10n/app_localizations.dart';
import '../data/animals_repository.dart';
import '../domain/animal_enums.dart';
import '../domain/animal_model.dart';
import '../domain/animal_state_log_model.dart';
import 'controllers/animals_controller.dart';

class AnimalDetailPage extends ConsumerWidget {
  const AnimalDetailPage({super.key, required this.animalId});

  final String animalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalsAsync = ref.watch(animalsControllerProvider);
    final l10n = AppLocalizations.of(context)!;
    
    final animal = animalsAsync.valueOrNull?.where((a) => a.id == animalId).firstOrNull;

    if (animalsAsync.isLoading && animal == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (animal == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.notFound)),
        body: Center(child: Text(l10n.animalNotFound)),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${animal.tagNumber} ${animal.name != null ? "(${animal.name})" : ""}'),
          actions: [
            RoleGuard(
              permission: Permission.manageAnimals,
              fallback: const SizedBox.shrink(),
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => context.go('/animals/$animalId/edit'),
                tooltip: l10n.editAnimal,
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: const Icon(Icons.info_outline), text: l10n.info),
              Tab(icon: const Icon(Icons.history), text: l10n.stateHistory),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Multidimensional Status Matrix & Details
            _AnimalOverviewTab(animal: animal),
            // Tab 2: Auditable State Transition History
            _AnimalStateHistoryTab(animalId: animalId),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.swap_horiz),
              label: Text(l10n.changeState),
              style: ElevatedButton.styleFrom(
                backgroundColor: WaanofiColors.primary,
                foregroundColor: WaanofiColors.surface,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () => _showChangeStateDialog(context, ref, animal),
            ),
          ),
        ),
      ),
    );
  }

  void _showChangeStateDialog(BuildContext context, WidgetRef ref, AnimalModel animal) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _ChangeStateBottomSheet(animal: animal),
    );
  }
}

class _AnimalOverviewTab extends StatelessWidget {
  const _AnimalOverviewTab({required this.animal});

  final AnimalModel animal;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isMale = animal.sex.toLowerCase() == 'male';

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Multidimensional Status Matrix (6 Cards)
        Text(
          l10n.status,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.primary),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 2.2,
          children: [
            _DimensionCard(
              title: l10n.lifecycleStatus,
              value: _formatLifecycle(animal.lifecycleStatus, l10n),
              color: _getLifecycleColor(animal.lifecycleStatus),
              icon: Icons.pets,
            ),
            _DimensionCard(
              title: l10n.reproductiveStatus,
              value: isMale ? l10n.notApplicable : _formatReproductive(animal.reproductiveStatus, l10n),
              color: _getReproductiveColor(animal.reproductiveStatus),
              icon: Icons.favorite_border,
            ),
            _DimensionCard(
              title: l10n.lactationStatus,
              value: isMale ? l10n.notApplicable : _formatLactation(animal.lactationStatus, l10n),
              color: _getLactationColor(animal.lactationStatus),
              icon: Icons.water_drop_outlined,
            ),
            _DimensionCard(
              title: l10n.healthStatus,
              value: _formatHealth(animal.healthStatus, l10n),
              color: _getHealthColor(animal.healthStatus),
              icon: Icons.health_and_safety_outlined,
            ),
            _DimensionCard(
              title: l10n.cattleClass,
              value: _formatCattleClass(animal.cattleClass, l10n),
              color: WaanofiColors.primary,
              icon: Icons.category_outlined,
            ),
            _DimensionCard(
              title: l10n.location,
              value: animal.location ?? l10n.unknown,
              color: WaanofiColors.textSecondary,
              icon: Icons.location_on_outlined,
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 8),

        // General Information Details
        Text(
          l10n.info,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.primary),
        ),
        const SizedBox(height: 8),
        _InfoTile(l10n.tagNumber.replaceAll(' *', ''), animal.tagNumber),
        _InfoTile(l10n.nameOptional.replaceAll(' (Optional)', '').replaceAll(' (Dirqama miti)', '').replaceAll(' (አማራጭ)', ''), animal.name ?? '-'),
        _InfoTile(l10n.breed, animal.breed ?? l10n.unknownBreed),
        _InfoTile(l10n.sex, animal.sex.toUpperCase()),
        if (animal.dob != null)
          _InfoTile(l10n.dateOfBirth, DateFormat('yyyy-MM-dd').format(animal.dob!)),
        _InfoTile(l10n.location, animal.location ?? '-'),
        const SizedBox(height: 80),
      ],
    );
  }

  Color _getLifecycleColor(AnimalLifecycleStatus s) {
    switch (s) {
      case AnimalLifecycleStatus.active:
        return WaanofiColors.success;
      case AnimalLifecycleStatus.sold:
      case AnimalLifecycleStatus.transferredOut:
        return WaanofiColors.primaryDark;
      case AnimalLifecycleStatus.deceased:
      case AnimalLifecycleStatus.culled:
        return WaanofiColors.error;
      case AnimalLifecycleStatus.missing:
      case AnimalLifecycleStatus.unknown:
        return WaanofiColors.warning;
    }
  }

  Color _getReproductiveColor(AnimalReproductiveStatus s) {
    switch (s) {
      case AnimalReproductiveStatus.pregnant:
        return Colors.purple;
      case AnimalReproductiveStatus.heat:
        return Colors.pink;
      case AnimalReproductiveStatus.served:
        return Colors.indigo;
      case AnimalReproductiveStatus.open:
        return WaanofiColors.success;
      default:
        return WaanofiColors.textSecondary;
    }
  }

  Color _getLactationColor(AnimalLactationStatus s) {
    switch (s) {
      case AnimalLactationStatus.lactating:
        return WaanofiColors.primary;
      case AnimalLactationStatus.dry:
        return Colors.amber.shade800;
      default:
        return WaanofiColors.textSecondary;
    }
  }

  Color _getHealthColor(AnimalHealthStatus s) {
    switch (s) {
      case AnimalHealthStatus.healthy:
        return WaanofiColors.success;
      case AnimalHealthStatus.sick:
        return WaanofiColors.error;
      case AnimalHealthStatus.underTreatment:
        return Colors.orange;
      case AnimalHealthStatus.quarantined:
        return Colors.red.shade900;
      case AnimalHealthStatus.recovering:
        return Colors.teal;
      default:
        return WaanofiColors.textSecondary;
    }
  }

  String _formatLifecycle(AnimalLifecycleStatus s, AppLocalizations l10n) {
    switch (s) {
      case AnimalLifecycleStatus.active: return l10n.active;
      case AnimalLifecycleStatus.sold: return l10n.sold;
      case AnimalLifecycleStatus.transferredOut: return l10n.transferredOut;
      case AnimalLifecycleStatus.deceased: return l10n.deceased;
      case AnimalLifecycleStatus.culled: return l10n.culled;
      case AnimalLifecycleStatus.missing: return l10n.missing;
      case AnimalLifecycleStatus.unknown: return l10n.unknown;
    }
  }

  String _formatReproductive(AnimalReproductiveStatus s, AppLocalizations l10n) {
    switch (s) {
      case AnimalReproductiveStatus.notApplicable: return l10n.notApplicable;
      case AnimalReproductiveStatus.open: return l10n.open;
      case AnimalReproductiveStatus.heat: return l10n.heat;
      case AnimalReproductiveStatus.served: return l10n.served;
      case AnimalReproductiveStatus.pregnant: return l10n.pregnant;
      case AnimalReproductiveStatus.postpartum: return l10n.postpartum;
      case AnimalReproductiveStatus.unknown: return l10n.unknown;
    }
  }

  String _formatLactation(AnimalLactationStatus s, AppLocalizations l10n) {
    switch (s) {
      case AnimalLactationStatus.notApplicable: return l10n.notApplicable;
      case AnimalLactationStatus.lactating: return l10n.lactating;
      case AnimalLactationStatus.dry: return l10n.dry;
      case AnimalLactationStatus.unknown: return l10n.unknown;
    }
  }

  String _formatHealth(AnimalHealthStatus s, AppLocalizations l10n) {
    switch (s) {
      case AnimalHealthStatus.healthy: return l10n.healthy;
      case AnimalHealthStatus.sick: return l10n.sick;
      case AnimalHealthStatus.underTreatment: return l10n.underTreatment;
      case AnimalHealthStatus.quarantined: return l10n.quarantined;
      case AnimalHealthStatus.recovering: return l10n.recovering;
      case AnimalHealthStatus.unknown: return l10n.unknown;
    }
  }

  String _formatCattleClass(CattleClass c, AppLocalizations l10n) {
    switch (c) {
      case CattleClass.calf: return l10n.calf;
      case CattleClass.heifer: return l10n.heifer;
      case CattleClass.cow: return l10n.cow;
      case CattleClass.bull: return l10n.bull;
      case CattleClass.steer: return l10n.steer;
      case CattleClass.unknown: return l10n.unknown;
    }
  }
}

class _DimensionCard extends StatelessWidget {
  const _DimensionCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  final String title;
  final String value;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 11, color: WaanofiColors.textSecondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textSecondary),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }
}

class _AnimalStateHistoryTab extends ConsumerWidget {
  const _AnimalStateHistoryTab({required this.animalId});

  final String animalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(animalsRepositoryProvider);
    final l10n = AppLocalizations.of(context)!;

    return StreamBuilder<List<AnimalStateLogModel>>(
      stream: repo.watchStateLogs(animalId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final logs = snapshot.data ?? [];
        if (logs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.history_toggle_off, size: 48, color: Colors.grey.shade400),
                const SizedBox(height: 12),
                Text(l10n.noStateHistory, style: const TextStyle(color: WaanofiColors.textSecondary)),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: logs.length,
          itemBuilder: (context, index) {
            final log = logs[index];
            return _StateLogCard(log: log);
          },
        );
      },
    );
  }
}

class _StateLogCard extends StatelessWidget {
  const _StateLogCard({required this.log});

  final AnimalStateLogModel log;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dateStr = DateFormat('yyyy-MM-dd HH:mm').format(log.effectiveTimestamp);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    log.dimension.name.toUpperCase(),
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark),
                  ),
                  backgroundColor: WaanofiColors.primaryLight,
                  padding: EdgeInsets.zero,
                ),
                Text(dateStr, style: const TextStyle(fontSize: 12, color: WaanofiColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                if (log.previousValue != null) ...[
                  Text(log.previousValue!, style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 14, color: Colors.grey),
                  const SizedBox(width: 8),
                ],
                Text(log.newValue, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: WaanofiColors.primary)),
              ],
            ),
            if (log.reason != null && log.reason!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text('${l10n.reason}: ${log.reason}', style: const TextStyle(fontSize: 13)),
            ],
            if (log.notes != null && log.notes!.isNotEmpty) ...[
              const SizedBox(height: 2),
              Text('${l10n.notes}: ${log.notes}', style: const TextStyle(fontSize: 12, color: WaanofiColors.textSecondary)),
            ],
          ],
        ),
      ),
    );
  }
}

class _ChangeStateBottomSheet extends ConsumerStatefulWidget {
  const _ChangeStateBottomSheet({required this.animal});

  final AnimalModel animal;

  @override
  ConsumerState<_ChangeStateBottomSheet> createState() => _ChangeStateBottomSheetState();
}

class _ChangeStateBottomSheetState extends ConsumerState<_ChangeStateBottomSheet> {
  AnimalStateDimension _dimension = AnimalStateDimension.health;
  String _targetValue = 'sick';
  final _reasonController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime _effectiveDate = DateTime.now();
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _updateDefaultTarget(AnimalStateDimension.health);
  }

  void _updateDefaultTarget(AnimalStateDimension dim) {
    setState(() {
      _dimension = dim;
      switch (dim) {
        case AnimalStateDimension.lifecycle:
          _targetValue = AnimalLifecycleStatus.active.name;
          break;
        case AnimalStateDimension.reproduction:
          _targetValue = AnimalReproductiveStatus.open.name;
          break;
        case AnimalStateDimension.lactation:
          _targetValue = AnimalLactationStatus.lactating.name;
          break;
        case AnimalStateDimension.health:
          _targetValue = AnimalHealthStatus.sick.name;
          break;
        case AnimalStateDimension.cattleClass:
          _targetValue = CattleClass.cow.name;
          break;
        case AnimalStateDimension.location:
          _targetValue = widget.animal.location ?? 'Barn A';
          break;
      }
    });
  }

  @override
  void dispose() {
    _reasonController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    
    // Check if destructive transition
    final isDestructive = _dimension == AnimalStateDimension.lifecycle &&
        (_targetValue == AnimalLifecycleStatus.sold.name ||
            _targetValue == AnimalLifecycleStatus.deceased.name ||
            _targetValue == AnimalLifecycleStatus.culled.name ||
            _targetValue == AnimalLifecycleStatus.transferredOut.name);

    if (isDestructive) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.confirmStateChange),
          content: Text(l10n.confirmDestructivePrompt),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: WaanofiColors.error),
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10n.confirmStateChange),
            ),
          ],
        ),
      );
      if (confirmed != true) return;
    }

    setState(() => _submitting = true);

    try {
      final repo = ref.read(animalsRepositoryProvider);
      await repo.changeState(
        animalId: widget.animal.id,
        dimension: _dimension,
        newValue: _targetValue,
        reason: _reasonController.text.trim().isEmpty ? null : _reasonController.text.trim(),
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        effectiveDate: _effectiveDate,
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.stateChangedSuccessfully), backgroundColor: WaanofiColors.success),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: WaanofiColors.error),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isMale = widget.animal.sex.toLowerCase() == 'male';

    return Container(
      decoration: const BoxDecoration(
        color: WaanofiColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.changeState,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.primary),
                ),
                IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),
            const Divider(),
            const SizedBox(height: 8),

            // Select Dimension
            DropdownButtonFormField<AnimalStateDimension>(
              value: _dimension,
              decoration: InputDecoration(labelText: l10n.dimension),
              items: [
                DropdownMenuItem(value: AnimalStateDimension.health, child: Text(l10n.healthStatus)),
                DropdownMenuItem(value: AnimalStateDimension.lifecycle, child: Text(l10n.lifecycleStatus)),
                if (!isMale) ...[
                  DropdownMenuItem(value: AnimalStateDimension.reproduction, child: Text(l10n.reproductiveStatus)),
                  DropdownMenuItem(value: AnimalStateDimension.lactation, child: Text(l10n.lactationStatus)),
                ],
                DropdownMenuItem(value: AnimalStateDimension.cattleClass, child: Text(l10n.cattleClass)),
                DropdownMenuItem(value: AnimalStateDimension.location, child: Text(l10n.location)),
              ],
              onChanged: (v) {
                if (v != null) _updateDefaultTarget(v);
              },
            ),
            const SizedBox(height: 12),

            // Select Target Value based on dimension
            if (_dimension == AnimalStateDimension.lifecycle)
              DropdownButtonFormField<String>(
                value: _targetValue,
                decoration: InputDecoration(labelText: l10n.newValue),
                items: AnimalLifecycleStatus.values
                    .map((s) => DropdownMenuItem(value: s.name, child: Text(s.name)))
                    .toList(),
                onChanged: (v) => setState(() => _targetValue = v!),
              )
            else if (_dimension == AnimalStateDimension.health)
              DropdownButtonFormField<String>(
                value: _targetValue,
                decoration: InputDecoration(labelText: l10n.newValue),
                items: AnimalHealthStatus.values
                    .map((s) => DropdownMenuItem(value: s.name, child: Text(s.name)))
                    .toList(),
                onChanged: (v) => setState(() => _targetValue = v!),
              )
            else if (_dimension == AnimalStateDimension.reproduction)
              DropdownButtonFormField<String>(
                value: _targetValue,
                decoration: InputDecoration(labelText: l10n.newValue),
                items: AnimalReproductiveStatus.values
                    .map((s) => DropdownMenuItem(value: s.name, child: Text(s.name)))
                    .toList(),
                onChanged: (v) => setState(() => _targetValue = v!),
              )
            else if (_dimension == AnimalStateDimension.lactation)
              DropdownButtonFormField<String>(
                value: _targetValue,
                decoration: InputDecoration(labelText: l10n.newValue),
                items: AnimalLactationStatus.values
                    .map((s) => DropdownMenuItem(value: s.name, child: Text(s.name)))
                    .toList(),
                onChanged: (v) => setState(() => _targetValue = v!),
              )
            else if (_dimension == AnimalStateDimension.cattleClass)
              DropdownButtonFormField<String>(
                value: _targetValue,
                decoration: InputDecoration(labelText: l10n.newValue),
                items: CattleClass.values
                    .map((s) => DropdownMenuItem(value: s.name, child: Text(s.name)))
                    .toList(),
                onChanged: (v) => setState(() => _targetValue = v!),
              )
            else if (_dimension == AnimalStateDimension.location)
              TextFormField(
                initialValue: _targetValue,
                decoration: InputDecoration(labelText: l10n.location),
                onChanged: (v) => _targetValue = v,
              ),

            const SizedBox(height: 12),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(labelText: l10n.reasonOptional),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: l10n.notesOptional),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitting ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: WaanofiColors.primary,
                  foregroundColor: WaanofiColors.surface,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: _submitting
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(l10n.save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
