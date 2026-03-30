import 'package:flutter/material.dart';
import 'package:localization_languages/UI/views/Home/home_view_model.dart';
import '../../../../app/app_constants.dart';


class BioCardWidget extends StatelessWidget {
  final HomeViewModel vm;
  const BioCardWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final code = vm.currentLocale.languageCode;
    final bioTitle = _titles[code] ?? _titles['en']!;
    final bioText = _texts[code] ?? _texts['en']!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0D1535), Color(0xFF1A1040)],
        ),
        border: Border.all(color: AppColors.accentSecondary.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentSecondary.withOpacity(0.08),
            blurRadius: 24,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.accentSecondary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('✨', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(width: 12),
              Text(
                bioTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            bioText,
            style: const TextStyle(
              fontSize: 14.5,
              color: AppColors.textSecondary,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Tag(label: '🚀 Flutter'),
              _Tag(label: '🎓 Student'),
              _Tag(label: '🇵🇰 Pakistani'),
              _Tag(label: '💡 Learner'),
            ],
          ),
        ],
      ),
    );
  }

  static const Map<String, String> _titles = {
    'en': 'About Me',
    'ur': 'میرے بارے میں',
    'de': 'Über mich',
    'zh': '关于我',
  };

  static const Map<String, String> _texts = {
    'en':
        'A passionate 18-year-old Flutter developer from Karachi, Pakistan. I love building beautiful and functional mobile applications. Currently a student turning curiosity into code, one widget at a time.',
    'ur':
        'کراچی، پاکستان سے ایک پرجوش 18 سالہ فلٹر ڈویلپر۔ مجھے خوبصورت اور فعال موبائل ایپلیکیشنز بنانا پسند ہے۔',
    'de':
        'Ein leidenschaftlicher 18-jähriger Flutter-Entwickler aus Karatschi, Pakistan. Ich liebe es, schöne und funktionale mobile Anwendungen zu erstellen.',
    'zh': '来自巴基斯坦卡拉奇，热情洋溢的18岁Flutter开发者。我热爱构建精美且实用的移动应用程序。',
  };
}

class _Tag extends StatelessWidget {
  final String label;
  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}