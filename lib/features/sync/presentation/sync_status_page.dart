import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:waanofi/core/theme/waanofi_colors.dart';

import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';

class SyncStatusPage extends ConsumerStatefulWidget {
  const SyncStatusPage({super.key});

  @override
  ConsumerState<SyncStatusPage> createState() => _SyncStatusPageState();
}

class _SyncStatusPageState extends ConsumerState<SyncStatusPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _dateFormat = DateFormat('MMM dd, hh:mm a');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coordinator = ref.watch(syncCoordinatorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Sync & Queue'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Trigger Sync Now',
            onPressed: () {
              coordinator.syncAll();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Manual synchronization triggered')),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: WaanofiColors.primary,
          unselectedLabelColor: WaanofiColors.textSecondary,
          indicatorColor: WaanofiColors.primary,
          tabs: const [
            Tab(text: 'Pending & Retrying', icon: Icon(Icons.queue)),
            Tab(text: 'Permanently Failed', icon: Icon(Icons.error_outline)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPendingTab(coordinator),
          _buildFailedTab(coordinator),
        ],
      ),
    );
  }

  Widget _buildPendingTab(SyncCoordinator coordinator) {
    return StreamBuilder<List<SyncOutboxItem>>(
      stream: coordinator.watchPending(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final items = snapshot.data ?? [];
        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, size: 64, color: Colors.green.shade400),
                const SizedBox(height: 16),
                const Text(
                  'All offline records synchronized!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.textSecondary),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: _buildStatusIcon(item.status),
                title: Text(
                  '${item.operation.toUpperCase()} — ${item.entityType}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text('Status: ${item.status} | Attempts: ${item.attemptCount}'),
                    if (item.nextRetryAt != null)
                      Text('Next retry: ${_dateFormat.format(item.nextRetryAt!)}'),
                    if (item.errorMessage != null && item.errorMessage!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Error: ${item.errorMessage}',
                          style: const TextStyle(color: WaanofiColors.error, fontSize: 12),
                        ),
                      ),
                  ],
                ),
                trailing: Text(
                  _dateFormat.format(item.createdAt),
                  style: const TextStyle(fontSize: 11, color: WaanofiColors.textSecondary),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFailedTab(SyncCoordinator coordinator) {
    return StreamBuilder<List<SyncOutboxItem>>(
      stream: coordinator.watchFailed(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final items = snapshot.data ?? [];
        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.thumb_up_alt_outlined, size: 64, color: Colors.blue.shade400),
                const SizedBox(height: 16),
                const Text(
                  'No permanently failed sync items',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.textSecondary),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: WaanofiColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text('Retry All Failed Records'),
                onPressed: () {
                  coordinator.retryPermanentlyFailed();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Queued failed items for resynchronization')),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: items.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    color: Colors.red.shade50,
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.error, color: WaanofiColors.error, size: 36),
                      title: Text(
                        '${item.operation.toUpperCase()} — ${item.entityType}',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.error),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text('Failed after ${item.attemptCount} attempts'),
                          if (item.lastErrorCode != null)
                            Text('Error Code: ${item.lastErrorCode}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          if (item.errorMessage != null)
                            Text('Detail: ${item.errorMessage}', style: const TextStyle(color: Colors.black87)),
                        ],
                      ),
                      trailing: Text(
                        _dateFormat.format(item.createdAt),
                        style: const TextStyle(fontSize: 11, color: WaanofiColors.textSecondary),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatusIcon(String status) {
    switch (status) {
      case 'processing':
        return const SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(strokeWidth: 3, color: WaanofiColors.primary),
        );
      case 'retrying':
        return const Icon(Icons.schedule, color: Colors.orange, size: 32);
      case 'pending':
      default:
        return const Icon(Icons.cloud_upload_outlined, color: Colors.blue, size: 32);
    }
  }
}
