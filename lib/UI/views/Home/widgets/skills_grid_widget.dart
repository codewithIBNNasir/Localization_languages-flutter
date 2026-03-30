import 'package:flutter/material.dart';
import 'package:localization_languages/UI/views/Home/home_view_model.dart';
import '../../../../app/app_constants.dart';


class SkillsGridWidget extends StatelessWidget {
  final HomeViewModel vm;
  const SkillsGridWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final code = vm.currentLocale.languageCode;
    final title = _titles[code] ?? _titles['en']!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppStrings.skills.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            final skill = AppStrings.skills[index];
            return _SkillTile(
              icon: skill['icon']!,
              label: skill['label']!,
              index: index,
            );
          },
        ),
      ],
    );
  }

  static const Map<String, String> _titles = {
    'en': 'My Skills',
    'ur': 'میری مہارتیں',
    'de': 'Meine Fähigkeiten',
    'zh': '我的技能',
  };
}

class _SkillTile extends StatefulWidget {
  final String icon;
  final String label;
  final int index;

  const _SkillTile({
    required this.icon,
    required this.label,
    required this.index,
  });

  @override
  State<_SkillTile> createState() => _SkillTileState();
}

class _SkillTileState extends State<_SkillTile>
    with SingleTickerProviderStateMixin {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.identity()
          ..scale(_pressed ? 0.95 : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.cardGradient,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _pressed
                ? AppColors.accent.withOpacity(0.5)
                : AppColors.cardBorder,
          ),
          boxShadow: _pressed
              ? [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.15),
                    blurRadius: 12,
                  )
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 6),
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}