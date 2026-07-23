import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/permission.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../../../shared/widgets/role_guard.dart';
import '../../animals/domain/animal_model.dart';
import '../domain/milk_record_model.dart';
import 'controllers/milk_entry_controller.dart';

class DailyMilkEntryPage extends ConsumerWidget {
  const DailyMilkEntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(milkEntryControllerProvider);
    final controller = ref.read(milkEntryControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Milk Entry'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Total: ${state.totalLitres.toStringAsFixed(1)}L',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Header Controls
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
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
                      decoration: const InputDecoration(labelText: 'Date'),
                      child: Text(state.date.toString().split(' ')[0]),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<MilkSession>(
                    value: state.session,
                    decoration: const InputDecoration(labelText: 'Session'),
                    items: MilkSession.values.map((s) {
                      return DropdownMenuItem(
                        value: s,
                        child: Text(s.name.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (s) {
                      if (s != null) controller.setSession(s);
                    },
                  ),
                ),
              ],
            ),
          ),
          
          // List of animals
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.animals.isEmpty
                    ? const Center(child: Text('No active lactating animals found.'))
                    : ListView.builder(
                        itemCount: state.animals.length,
                        itemBuilder: (context, index) {
                          final animal = state.animals[index];
                          // Do NOT watch the whole state here to avoid losing focus on typing
                          return _MilkEntryRow(
                            animal: animal,
                            initialValue: state.entries[animal.id],
                            sevenDayAvg: state.sevenDayAverages[animal.id] ?? 0.0,
                            history: state.sevenDayHistories[animal.id] ?? [],
                            onChanged: (val) => controller.setEntry(animal.id, val),
                          );
                        },
                      ),
          ),
        ],
      ),
      floatingActionButton: RoleGuard(
        permission: Permission.recordMilk,
        fallback: const SizedBox.shrink(),
        child: FloatingActionButton.extended(
          onPressed: () async {
            await controller.saveBatch();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Saved locally. Will sync when online.'),
                  backgroundColor: WaanofiColors.success,
                ),
              );
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(Icons.save),
          label: const Text('Save Batch'),
        ),
      ),
    );
  }
}

class _MilkEntryRow extends StatefulWidget {
  const _MilkEntryRow({
    required this.animal,
    required this.initialValue,
    required this.sevenDayAvg,
    required this.history,
    required this.onChanged,
  });

  final AnimalModel animal;
  final double? initialValue;
  final double sevenDayAvg;
  final List<double> history;
  final ValueChanged<double?> onChanged;

  @override
  State<_MilkEntryRow> createState() => _MilkEntryRowState();
}

class _MilkEntryRowState extends State<_MilkEntryRow> {
  late final TextEditingController _controller;
  double? _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    _controller = TextEditingController(
        text: _currentValue != null ? _currentValue.toString() : '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _hasDrop {
    if (_currentValue == null || widget.sevenDayAvg == 0) return false;
    // Warning if current value is < 80% of 7-day average
    return _currentValue! < (widget.sevenDayAvg * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    // Generate spots for the sparkline
    final spots = <FlSpot>[];
    for (int i = 0; i < widget.history.length; i++) {
      spots.add(FlSpot(i.toDouble(), widget.history[i]));
    }
    
    // Add the current value to the sparkline if available
    if (_currentValue != null) {
      spots.add(FlSpot(widget.history.length.toDouble(), _currentValue!));
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Animal Info
            CircleAvatar(
              backgroundColor: WaanofiColors.primaryLight,
              child: Text(
                widget.animal.tagNumber.substring(0, widget.animal.tagNumber.length > 2 ? 2 : widget.animal.tagNumber.length),
                style: const TextStyle(color: WaanofiColors.primaryDark),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.animal.tagNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                  if (widget.animal.name != null)
                    Text(widget.animal.name!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('Avg: ${widget.sevenDayAvg.toStringAsFixed(1)}L', style: const TextStyle(fontSize: 10, color: WaanofiColors.primaryDark)),
                ],
              ),
            ),
            
            // Mini Sparkline
            if (spots.isNotEmpty)
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 30,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          color: _hasDrop ? WaanofiColors.error : WaanofiColors.primary,
                          barWidth: 2,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                      titlesData: const FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: false),
                      lineTouchData: const LineTouchData(enabled: false),
                    ),
                  ),
                ),
              )
            else
              const Expanded(flex: 1, child: SizedBox.shrink()),

            const SizedBox(width: 8),

            // Warning Icon
            if (_hasDrop)
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.warning_amber_rounded, color: WaanofiColors.error),
              ),

            // Input Field
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: _controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Litres',
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
                onChanged: (val) {
                  final parsed = double.tryParse(val);
                  setState(() => _currentValue = parsed);
                  widget.onChanged(parsed);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
