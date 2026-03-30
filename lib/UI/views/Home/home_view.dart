import 'package:flutter/material.dart';
import 'package:localization_languages/UI/views/Home/home_view_model.dart';
import 'package:localization_languages/UI/views/Home/widgets/avatar_widget.dart';
import 'package:localization_languages/UI/views/Home/widgets/bio_card_widget.dart';
import 'package:localization_languages/UI/views/Home/widgets/info_card_widget.dart';
import 'package:localization_languages/UI/views/Home/widgets/language_switcher_widget.dart';
import 'package:localization_languages/UI/views/Home/widgets/skills_grid_widget.dart';
import 'package:localization_languages/UI/views/Home/widgets/stat_card_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app_constants.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (vm) => vm.init(),
      builder: (context, vm, child) {
        return Localizations.override(
          context: context,
          locale: vm.currentLocale,
          child: Directionality(
            textDirection:
                vm.isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              backgroundColor: AppColors.primary,
              body: _HomeBody(vm: vm),
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
class _HomeBody extends StatelessWidget {
  final HomeViewModel vm;
  const _HomeBody({required this.vm});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // ── Hero SliverAppBar ──────────────────────────────────
        SliverAppBar(
          expandedHeight: 320,
          pinned: true,
          backgroundColor: AppColors.primary,
          flexibleSpace: FlexibleSpaceBar(
            background: _HeroHeader(vm: vm),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: LanguageSwitcherWidget(vm: vm),
            ),
          ],
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),

                // Stats Row
                _StatsRow(vm: vm),
                const SizedBox(height: 24),

                // Info
                InfoCardWidget(vm: vm),
                const SizedBox(height: 24),

                // BioCard
                BioCardWidget(vm: vm),
                const SizedBox(height: 24),

                // Skil
                SkillsGridWidget(vm: vm),
                const SizedBox(height: 24),

                // Language Row
                _LanguagePickerSection(vm: vm),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
class _HeroHeader extends StatelessWidget {
  final HomeViewModel vm;
  const _HeroHeader({required this.vm});

  @override
  Widget build(BuildContext context) {
    final loc = _locOf(context, vm);

    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: Stack(
        children: [
          // Background decorations
          Positioned(
            top: -40,
            right: -40,
            child: _GlowCircle(
              size: 200,
              color: AppColors.accent.withOpacity(0.08),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -30,
            child: _GlowCircle(
              size: 150,
              color: AppColors.accentSecondary.withOpacity(0.08),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 80, 24, 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AvatarWidget(vm: vm),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Greeting badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF00D4FF),
                              Color(0xFF7B2FFF)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          loc.greeting,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Name
                      Text(
                        loc.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.5,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Role
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            const LinearGradient(
                          colors: [
                            AppColors.accent,
                            AppColors.accentSecondary
                          ],
                        ).createShader(bounds),
                        child: Text(
                          loc.roleValue,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
class _StatsRow extends StatelessWidget {
  final HomeViewModel vm;
  const _StatsRow({required this.vm});

  @override
  Widget build(BuildContext context) {
    final loc = _locOf(context, vm);
    return Row(
      children: [
        Expanded(
          child: StatCardWidget(
            icon: '🎂',
            value: '18',
            label: loc.ageLabel,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCardWidget(
            icon: '💙',
            value: '1+',
            label: 'Years Flutter',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCardWidget(
            icon: '🚀',
            value: '10+',
            label: 'Projects',
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
class _LanguagePickerSection extends StatelessWidget {
  final HomeViewModel vm;
  const _LanguagePickerSection({required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _locOf(context, vm).switchLanguage,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Row(
          children: List.generate(
            AppStrings.languages.length,
            (i) {
              final lang = AppStrings.languages[i];
              final isSelected = vm.currentLanguageIndex == i;
              return Expanded(
                child: GestureDetector(
                  onTap: () => vm.selectLanguage(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsets.only(
                        right: i < AppStrings.languages.length - 1 ? 8 : 0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 8),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [
                                AppColors.accent,
                                AppColors.accentSecondary
                              ],
                            )
                          : null,
                      color: isSelected ? null : AppColors.cardBg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? Colors.transparent
                            : AppColors.cardBorder,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          lang['flag'] as String,
                          style: const TextStyle(fontSize: 22),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          lang['code'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? Colors.white
                                : AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
class _GlowCircle extends StatelessWidget {
  final double size;
  final Color color;
  const _GlowCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

// Helper to get localizations that respect the current locale override
// We use the Localizations.override + Builder pattern, but since we set
// Directionality + Localizations.override at root, we access via Builder.
_AppLoc _locOf(BuildContext context, HomeViewModel vm) {
  return _AppLoc(vm);
}

class _AppLoc {
  final HomeViewModel vm;
  _AppLoc(this.vm);

  String get greeting => _get('greeting');
  String get name => _get('name');
  String get nameLabel => _get('nameLabel');
  String get ageLabel => _get('ageLabel');
  String get ageValue => _get('ageValue');
  String get roleLabel => _get('roleLabel');
  String get roleValue => _get('roleValue');
  String get nationalityLabel => _get('nationalityLabel');
  String get nationalityValue => _get('nationalityValue');
  String get bioTitle => _get('bioTitle');
  String get bioText => _get('bioText');
  String get skillsTitle => _get('skillsTitle');
  String get switchLanguage => _get('switchLanguage');
  String get currentLanguage => _get('currentLanguage');
  String get contactTitle => _get('contactTitle');
  String get locationText => _get('locationText');
  String get passionText => _get('passionText');

  String _get(String key) {
    final code = vm.currentLocale.languageCode;
    return _translations[code]?[key] ?? _translations['en']![key]!;
  }

  static const Map<String, Map<String, String>> _translations = {
    'en': {
      'greeting': 'Hello, World! 👋',
      'name': 'Hammad Nasir',
      'nameLabel': 'Name',
      'ageLabel': 'Age',
      'ageValue': '18 Years Old',
      'roleLabel': 'Role',
      'roleValue': 'Student & Flutter Developer',
      'nationalityLabel': 'Nationality',
      'nationalityValue': 'Karachi, Pakistan 🇵🇰',
      'bioTitle': 'About Me',
      'bioText':
          'A passionate 18-year-old Flutter developer from Karachi, Pakistan. I love building beautiful and functional mobile applications. Currently a student turning curiosity into code, one widget at a time.',
      'skillsTitle': 'My Skills',
      'switchLanguage': 'Switch Language',
      'currentLanguage': 'English',
      'contactTitle': "Let's Connect",
      'locationText': 'Karachi, Pakistan',
      'passionText': 'Passionate about Flutter & Mobile Dev',
    },
    'ur': {
      'greeting': 'ہیلو، دنیا! 👋',
      'name': 'حماد ناصر',
      'nameLabel': 'نام',
      'ageLabel': 'عمر',
      'ageValue': '18 سال',
      'roleLabel': 'کردار',
      'roleValue': 'طالب علم اور فلٹر ڈویلپر',
      'nationalityLabel': 'قومیت',
      'nationalityValue': 'کراچی، پاکستان 🇵🇰',
      'bioTitle': 'میرے بارے میں',
      'bioText':
          'کراچی، پاکستان سے ایک پرجوش 18 سالہ فلٹر ڈویلپر۔ مجھے خوبصورت اور فعال موبائل ایپلیکیشنز بنانا پسند ہے۔',
      'skillsTitle': 'میری مہارتیں',
      'switchLanguage': 'زبان تبدیل کریں',
      'currentLanguage': 'اردو',
      'contactTitle': 'رابطہ کریں',
      'locationText': 'کراچی، پاکستان',
      'passionText': 'فلٹر اور موبائل ڈویلپمنٹ کا شوق',
    },
    'de': {
      'greeting': 'Hallo, Welt! 👋',
      'name': 'Hammad Nasir',
      'nameLabel': 'Name',
      'ageLabel': 'Alter',
      'ageValue': '18 Jahre alt',
      'roleLabel': 'Rolle',
      'roleValue': 'Student & Flutter-Entwickler',
      'nationalityLabel': 'Nationalität',
      'nationalityValue': 'Karatschi, Pakistan 🇵🇰',
      'bioTitle': 'Über mich',
      'bioText':
          'Ein leidenschaftlicher 18-jähriger Flutter-Entwickler aus Karatschi, Pakistan. Ich liebe es, schöne und funktionale mobile Anwendungen zu erstellen.',
      'skillsTitle': 'Meine Fähigkeiten',
      'switchLanguage': 'Sprache wechseln',
      'currentLanguage': 'Deutsch',
      'contactTitle': 'Lass uns verbinden',
      'locationText': 'Karatschi, Pakistan',
      'passionText': 'Leidenschaft für Flutter & Mobile-Entwicklung',
    },
    'zh': {
      'greeting': '你好，世界！👋',
      'name': '哈马德·纳西尔',
      'nameLabel': '姓名',
      'ageLabel': '年龄',
      'ageValue': '18岁',
      'roleLabel': '职位',
      'roleValue': '学生 & Flutter开发者',
      'nationalityLabel': '国籍',
      'nationalityValue': '巴基斯坦卡拉奇 🇵🇰',
      'bioTitle': '关于我',
      'bioText':
          '来自巴基斯坦卡拉奇，热情洋溢的18岁Flutter开发者。我热爱构建精美且实用的移动应用程序。',
      'skillsTitle': '我的技能',
      'switchLanguage': '切换语言',
      'currentLanguage': '中文',
      'contactTitle': '联系我',
      'locationText': '巴基斯坦卡拉奇',
      'passionText': '热爱Flutter和移动开发',
    },
  };
}