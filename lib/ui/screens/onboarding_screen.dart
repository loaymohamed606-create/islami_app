import 'package:flutter/material.dart';
import 'package:islami/core/utils/routes.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String? description;

  const OnboardingItem({
    required this.image,
    required this.title,
    this.description,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const Color _gold = Color(0xFFE2BE7F);
  static const Color _bg = Color(0xFF202020);

  final PageController _controller = PageController();
  int _index = 0;

  final List<OnboardingItem> _items = const [
    OnboardingItem(
      image: 'assets/images/onboarding1.png',
      title: 'Welcome To Islami App',
    ),
    OnboardingItem(
      image: 'assets/images/onboarding2.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnboardingItem(
      image: 'assets/images/onboarding3.png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingItem(
      image: 'assets/images/onboarding4.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingItem(
      image: 'assets/images/onboarding5.png',
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  bool get _isFirst => _index == 0;
  bool get _isLast => _index == _items.length - 1;

  void _next() {
    if (_isLast) {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _back() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Image.asset('assets/images/img_header.png', height: 173),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _items.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) => _buildPage(_items[i]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Row(
                children: [
                  // Back
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _isFirst
                          ? const SizedBox.shrink()
                          : TextButton(
                              onPressed: _back,
                              child: const Text(
                                'Back',
                                style: TextStyle(color: _gold),
                              ),
                            ),
                    ),
                  ),
                  Row(
                    children: List.generate(_items.length, (i) {
                      final active = i == _index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: active ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: active ? _gold : Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    }),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _next,
                        child: Text(
                          _isLast ? 'Finish' : 'Next',
                          style: const TextStyle(color: _gold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(
            child: Center(child: Image.asset(item.image, fit: BoxFit.contain)),
          ),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: _gold,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (item.description != null) ...[
            const SizedBox(height: 12),
            Text(
              item.description!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: _gold, fontSize: 14),
            ),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
