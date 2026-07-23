import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../../analytics/domain/dashboard_stats_model.dart';
import 'controllers/reports_controller.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  Future<void> _exportCsv(BuildContext context, ReportsState state) async {
    final rows = state.reportData.valueOrNull;
    if (rows == null || rows.isEmpty) return;

    List<List<dynamic>> csvData = [
      ['Group Label', 'Total Litres', 'Session Count'],
      ...rows.map((r) => [r.groupLabel, r.totalLitres, r.sessionCount])
    ];

    String csv = const ListToCsvConverter().convert(csvData);

    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/report_${DateTime.now().millisecondsSinceEpoch}.csv';
    final file = File(path);
    await file.writeAsString(csv);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved to $path')));
    }
  }

  Future<void> _exportPdf(BuildContext context, ReportsState state) async {
    final rows = state.reportData.valueOrNull;
    if (rows == null || rows.isEmpty) return;

    final doc = pw.Document();
    
    doc.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Waanofi Dairy - Milk Report', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 8),
              pw.Text('Date Range: ${DateFormat('yyyy-MM-dd').format(state.startDate)} to ${DateFormat('yyyy-MM-dd').format(state.endDate)}'),
              pw.Text('Group By: ${state.groupBy}'),
              pw.SizedBox(height: 24),
              pw.Table.fromTextArray(
                headers: ['Label', 'Total Litres', 'Sessions'],
                data: rows.map((r) => [r.groupLabel, r.totalLitres.toStringAsFixed(1), r.sessionCount.toString()]).toList(),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reportsControllerProvider);
    final controller = ref.read(reportsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: state.reportData.hasValue ? () => _exportPdf(context, state) : null,
            tooltip: 'Export PDF',
          ),
          IconButton(
            icon: const Icon(Icons.table_chart),
            onPressed: state.reportData.hasValue ? () => _exportCsv(context, state) : null,
            tooltip: 'Export CSV',
          ),
        ],
      ),
      body: Column(
        children: [
          // Controls
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.date_range),
                        label: Text('${DateFormat('MMM d').format(state.startDate)} - ${DateFormat('MMM d').format(state.endDate)}'),
                        onPressed: () async {
                          final range = await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            initialDateRange: DateTimeRange(start: state.startDate, end: state.endDate),
                          );
                          if (range != null) {
                            controller.updateDateRange(range.start, range.end);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: state.groupBy,
                  decoration: const InputDecoration(labelText: 'Group By', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'day', child: Text('By Day')),
                    DropdownMenuItem(value: 'month', child: Text('By Month')),
                    DropdownMenuItem(value: 'animal', child: Text('By Animal')),
                  ],
                  onChanged: (v) {
                    if (v != null) controller.updateGroupBy(v);
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Data
          Expanded(
            child: state.reportData.when(
              data: (rows) {
                if (rows.isEmpty) return const Center(child: Text('No data for this period.'));
                return ListView.separated(
                  itemCount: rows.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final row = rows[index];
                    return ListTile(
                      title: Text(row.groupLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('${row.sessionCount} sessions'),
                      trailing: Text('${row.totalLitres.toStringAsFixed(1)} L', 
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.primary)),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
