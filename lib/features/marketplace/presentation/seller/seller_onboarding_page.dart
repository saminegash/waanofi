import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/seller_profile_repository.dart';
import 'package:waanofi/features/marketplace/domain/farm_market_profile_model.dart';

class SellerOnboardingPage extends ConsumerWidget {
  const SellerOnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final profileStream = ref.watch(sellerProfileRepositoryProvider).watchProfile();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.sellerHub, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.surface,
        elevation: 0,
        foregroundColor: WaanofiColors.textPrimary,
      ),
      body: StreamBuilder<FarmMarketProfileModel?>(
        stream: profileStream,
        builder: (context, snapshot) {
          final profile = snapshot.data;
          final hasProfile = profile != null;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [WaanofiColors.primary, WaanofiColors.primary.withValues(alpha: 0.85)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: WaanofiColors.primary.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.storefront_rounded, size: 48, color: Colors.white),
                        SizedBox(height: 16),
                        Text(
                          'Welcome to Waanofi Marketplace',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Connect your farm production directly with consumers and businesses. Sell fresh dairy and pasture-raised table eggs with full quality transparency.',
                          style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('How it Works', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                  const SizedBox(height: 16),
                  _buildStepCard(
                    step: '1',
                    title: 'Create Your Public Profile',
                    description: 'Set up your farm brand, contact information, pickup locations, and operational hours.',
                    icon: Icons.badge_outlined,
                  ),
                  const SizedBox(height: 12),
                  _buildStepCard(
                    step: '2',
                    title: 'Submit for Verification',
                    description: 'Our team reviews your farm operations to ensure quality safety standards and authentic sourcing.',
                    icon: Icons.verified_user_outlined,
                  ),
                  const SizedBox(height: 12),
                  _buildStepCard(
                    step: '3',
                    title: 'Pack & Inspect Batches',
                    description: 'Convert daily milk and egg production into quality-checked inventory batches.',
                    icon: Icons.inventory_2_outlined,
                  ),
                  const SizedBox(height: 12),
                  _buildStepCard(
                    step: '4',
                    title: 'Publish Active Listings',
                    description: 'Set prices in ETB and sell directly with automated inventory deduction and expiration safeguards.',
                    icon: Icons.campaign_outlined,
                  ),
                  const SizedBox(height: 36),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WaanofiColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                    ),
                    onPressed: () {
                      if (hasProfile) {
                        context.push('/seller/dashboard');
                      } else {
                        context.push('/seller/profile/edit');
                      }
                    },
                    child: Text(
                      hasProfile ? 'Go to ${l10n.sellerHub}' : 'Get Started — ${l10n.publicSellerProfile}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStepCard({required String step, required String title, required String description, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: WaanofiColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: WaanofiColors.outline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: WaanofiColors.primary.withValues(alpha: 0.1),
            child: Text(step, style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.primary)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 13, color: WaanofiColors.textSecondary, height: 1.4)),
              ],
            ),
          ),
          Icon(icon, color: WaanofiColors.primary.withValues(alpha: 0.6)),
        ],
      ),
    );
  }
}
