import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/theme/waanofi_colors.dart';
import 'package:waanofi/l10n/app_localizations.dart';
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
      await repo.createWorker(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        fullName: _fullNameController.text.trim(),
        role: _selectedRole,
      );

      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.workerCreatedSuccess), backgroundColor: WaanofiColors.success),
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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.adminConsole),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: const Icon(Icons.people), text: l10n.workers),
            Tab(icon: const Icon(Icons.history), text: l10n.auditLog),
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
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.addNewWorker, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                        decoration: InputDecoration(labelText: l10n.fullName, prefixIcon: const Icon(Icons.person_outline)),
                        validator: (v) => (v == null || v.trim().isEmpty) ? l10n.required : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedRole,
                        decoration: InputDecoration(labelText: l10n.role),
                        items: [
                          DropdownMenuItem(value: 'user', child: Text(l10n.workerUser)),
                          DropdownMenuItem(value: 'admin', child: Text(l10n.admin)),
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
                        decoration: InputDecoration(labelText: l10n.email, prefixIcon: const Icon(Icons.email_outlined)),
                        validator: (v) => (v == null || !v.contains('@')) ? l10n.validEmailRequired : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: l10n.password, prefixIcon: const Icon(Icons.lock_outline)),
                        validator: (v) => (v == null || v.length < 6) ? l10n.passwordMinLength : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _createWorker,
                    child: _loading ? const CircularProgressIndicator() : Text(l10n.createAccountBtn),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 48),
          Text(l10n.currentTeam, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                      backgroundColor: w.active ? WaanofiColors.primary.withOpacity(0.1) : WaanofiColors.error.withOpacity(0.1),
                      child: Icon(Icons.person, color: w.active ? WaanofiColors.primary : WaanofiColors.error),
                    ),
                    title: Text('${w.fullName} (${w.role})', style: TextStyle(decoration: w.active ? null : TextDecoration.lineThrough)),
                    subtitle: Text('${l10n.status}: ${w.active ? l10n.active : l10n.deactivated}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButton<String>(
                          value: w.role,
                          items: [
                            DropdownMenuItem(value: 'user', child: Text(l10n.workerUser)),
                            DropdownMenuItem(value: 'admin', child: Text(l10n.admin)),
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
            error: (e, _) => Text('${l10n.error}: $e'),
          ),
        ],
      ),
    );
  }

  Widget _buildAuditTab() {
    final state = ref.watch(adminControllerProvider);
    final l10n = AppLocalizations.of(context)!;
    return state.auditLogs.when(
      data: (logs) {
        if (logs.isEmpty) return Center(child: Text(l10n.noAuditLogs));
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: logs.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final log = logs[index];
            final color = log.action == 'DELETE' ? WaanofiColors.error : (log.action == 'INSERT' ? WaanofiColors.success : WaanofiColors.primary);
            final changedFields = _getChangedFields(log.oldData, log.newData, l10n);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('MMM dd, HH:mm').format(log.changedAt), style: const TextStyle(color: WaanofiColors.textSecondary)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                      child: Text(log.action, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('${log.changedByFullName} ${l10n.modified} ${log.tableName}', style: const TextStyle(fontWeight: FontWeight.bold)),
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
      error: (e, _) => Center(child: Text('${l10n.error}: $e')),
    );
  }

  String _getChangedFields(Map<String, dynamic>? oldData, Map<String, dynamic>? newData, AppLocalizations l10n) {
    if (oldData == null && newData != null) return '${l10n.created}: ${jsonEncode(newData)}';
    if (oldData != null && newData == null) return '${l10n.deleted}: ${jsonEncode(oldData)}';
    
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
