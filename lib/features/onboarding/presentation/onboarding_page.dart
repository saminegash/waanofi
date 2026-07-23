import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/theme/waanofi_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);
    if (mounted) context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final pages = [
      _OnboardingData(
        title: l10n.onboardingTitle1,
        description: l10n.onboardingDesc1,
        icon: Icons.pets,
        color: WaanofiColors.primary,
      ),
      _OnboardingData(
        title: l10n.onboardingTitle2,
        description: l10n.onboardingDesc2,
        icon: Icons.water_drop,
        color: Colors.blue,
      ),
      _OnboardingData(
        title: l10n.onboardingTitle3,
        description: l10n.onboardingDesc3,
        icon: Icons.trending_up,
        color: WaanofiColors.secondary,
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (idx) => setState(() => _currentPage = idx),
            itemCount: pages.length,
            itemBuilder: (context, index) {
              final page = pages[index];
              return Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(page.icon, size: 120, color: page.color),
                    const SizedBox(height: 48),
                    Text(
                      page.title,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      page.description,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _completeOnboarding,
                  child: Text(l10n.skip, style: const TextStyle(color: Colors.grey)),
                ),
                Row(
                  children: List.generate(pages.length, (index) => _buildDot(index)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == pages.length - 1) {
                      _completeOnboarding();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(_currentPage == pages.length - 1 ? l10n.getStarted : l10n.next),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? WaanofiColors.primary : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _OnboardingData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  _OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
