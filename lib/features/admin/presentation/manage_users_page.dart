import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/theme/waanofi_colors.dart';
import 'controllers/admin_controller.dart';

class ManageUsersPage extends ConsumerStatefulWidget {
  const ManageUsersPage({super.key});

  @override
  ConsumerState<ManageUsersPage> createState() => _ManageUsersPageState();
}

class _ManageUsersPageState extends ConsumerState<ManageUsersPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedRole = 'user';
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _createWorker() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    try {
      final repo = ref.read(authRepositoryProvider);
      // Wait, we need to pass role to createWorker. We'll need to update AuthRepository as well.
      // We will do that in another step if we haven't already.
      await repo.createWorker(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        fullName: _fullNameController.text.trim(),
        role: _selectedRole, // Assuming we will update AuthRepository
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Worker created successfully!'), backgroundColor: WaanofiColors.success),
        );
        _fullNameController.clear();
        _emailController.clear();
        _passwordController.clear();
        ref.read(adminControllerProvider.notifier).fetchWorkers();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()), backgroundColor: WaanofiColors.error));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Console'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.people), text: 'Workers'),
            Tab(icon: Icon(Icons.history), text: 'Audit Log'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildWorkersTab(),
          _buildAuditTab(),
        ],
      ),
    );
  }

  Widget _buildWorkersTab() {
    final state = ref.watch(adminControllerProvider);
    final controller = ref.read(adminControllerProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Add New Worker', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _fullNameController,
                        decoration: const InputDecoration(labelText: 'Full Name', prefixIcon: Icon(Icons.person_outline)),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedRole,
                        decoration: const InputDecoration(labelText: 'Role'),
                        items: const [
                          DropdownMenuItem(value: 'user', child: Text('Worker (User)')),
                          DropdownMenuItem(value: 'admin', child: Text('Admin')),
                        ],
                        onChanged: (v) => setState(() => _selectedRole = v!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
                        validator: (v) => (v == null || !v.contains('@')) ? 'Valid email required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline)),
                        validator: (v) => (v == null || v.length < 6) ? 'Min 6 chars' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _createWorker,
                    child: _loading ? const CircularProgressIndicator() : const Text('Create Account'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 48),
          const Text('Current Team', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          state.workers.when(
            data: (workers) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: workers.length,
              itemBuilder: (context, index) {
                final w = workers[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: w.active ? WaanofiColors.primary.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                      child: Icon(Icons.person, color: w.active ? WaanofiColors.primary : Colors.red),
                    ),
                    title: Text('${w.fullName} (${w.role})', style: TextStyle(decoration: w.active ? null : TextDecoration.lineThrough)),
                    subtitle: Text('Status: ${w.active ? 'Active' : 'Deactivated'}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButton<String>(
                          value: w.role,
                          items: const [
                            DropdownMenuItem(value: 'user', child: Text('User')),
                            DropdownMenuItem(value: 'admin', child: Text('Admin')),
                          ],
                          onChanged: (newRole) {
                            if (newRole != null && newRole != w.role) {
                              controller.updateWorkerRole(w.id, newRole);
                            }
                          },
                        ),
                        const SizedBox(width: 8),
                        Switch(
                          value: w.active,
                          onChanged: (val) => controller.toggleWorkerStatus(w.id, val),
                          activeColor: WaanofiColors.primary,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
          ),
        ],
      ),
    );
  }

  Widget _buildAuditTab() {
    final state = ref.watch(adminControllerProvider);
    return state.auditLogs.when(
      data: (logs) {
        if (logs.isEmpty) return const Center(child: Text('No audit logs available.'));
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: logs.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final log = logs[index];
            final color = log.action == 'DELETE' ? Colors.red : (log.action == 'INSERT' ? Colors.green : Colors.blue);
            final changedFields = _getChangedFields(log.oldData, log.newData);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('MMM dd, HH:mm').format(log.changedAt), style: const TextStyle(color: Colors.grey)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                      child: Text(log.action, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('${log.changedByFullName} modified ${log.tableName}', style: const TextStyle(fontWeight: FontWeight.bold)),
                if (changedFields.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(changedFields, style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
                ]
              ],
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }

  String _getChangedFields(Map<String, dynamic>? oldData, Map<String, dynamic>? newData) {
    if (oldData == null && newData != null) return 'Created: ${jsonEncode(newData)}';
    if (oldData != null && newData == null) return 'Deleted: ${jsonEncode(oldData)}';
    
    if (oldData != null && newData != null) {
      List<String> changes = [];
      for (final key in newData.keys) {
        if (oldData[key] != newData[key] && key != 'updated_at') {
          changes.add('$key: ${oldData[key]} -> ${newData[key]}');
        }
      }
      return changes.join('\n');
    }
    return '';
  }
}
