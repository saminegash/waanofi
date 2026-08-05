import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/seller_profile_repository.dart';
import 'package:waanofi/features/marketplace/domain/farm_market_profile_model.dart';

class VerificationSubmissionPage extends ConsumerWidget {
  const VerificationSubmissionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final profileStream = ref.watch(sellerProfileRepositoryProvider).watchProfile();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.verificationSubmission, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.surface,
        elevation: 0,
        foregroundColor: WaanofiColors.textPrimary,
      ),
      body: StreamBuilder<FarmMarketProfileModel?>(
        stream: profileStream,
        builder: (context, snapshot) {
          final profile = snapshot.data;
          final isPending = profile?.isPending ?? false;
          final isApproved = profile?.isEligibleToPublish ?? false;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (isApproved) ...[
                    _buildStatusBanner(
                      icon: Icons.check_circle_rounded,
                      color: WaanofiColors.primary,
                      title: 'Marketplace Profile Approved!',
                      subtitle: 'Your farm is fully verified. You can convert production into batches and publish active product listings.',
                    ),
                  ] else if (isPending) ...[
                    _buildStatusBanner(
                      icon: Icons.access_time_filled_rounded,
                      color: Colors.amber.shade700,
                      title: 'Verification Under Review',
                      subtitle: 'Your verification submission has been received. Our agricultural quality inspectors will process your review within 24 hours.',
                    ),
                  ] else ...[
                    _buildStatusBanner(
                      icon: Icons.info_outline_rounded,
                      color: Colors.blue.shade700,
                      title: 'Ready for Platform Review',
                      subtitle: 'To maintain consumer trust and dairy/poultry hygienic safety, all seller profiles must be approved prior to going live.',
                    ),
                  ],
                  const SizedBox(height: 28),
                  const Text('Verification Standards & Requirements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                  const SizedBox(height: 12),
                  _buildReqItem(title: 'Valid Farm Identity', desc: 'Accurate location and operational contact phone number.'),
                  _buildReqItem(title: 'Quality Controlled Inventory', desc: 'Commitment to logging daily milk refrigeration temps and clean table egg grading.'),
                  _buildReqItem(title: 'Honest Advertising', desc: 'All listed quantities and pricing must reflect physical available stock without deceptive inflation.'),
                  const SizedBox(height: 36),
                  if (!isApproved && !isPending)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: WaanofiColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () async {
                        await ref.read(sellerProfileRepositoryProvider).submitForVerification();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Verification submitted!'), backgroundColor: WaanofiColors.primary),
                          );
                        }
                      },
                      child: Text('Submit for Platform Verification', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: WaanofiColors.primary),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () => context.go('/seller/dashboard'),
                    child: Text('Continue to ${l10n.sellerHub}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.primary)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusBanner({required IconData icon, required Color color, required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(16), border: Border.all(color: color.withValues(alpha: 0.3))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 36),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
                const SizedBox(height: 6),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: WaanofiColors.textSecondary, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReqItem({required String title, required String desc}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: WaanofiColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                Text(desc, style: const TextStyle(fontSize: 13, color: WaanofiColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
