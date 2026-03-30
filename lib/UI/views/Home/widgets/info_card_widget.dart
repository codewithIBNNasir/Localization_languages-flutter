import 'package:flutter/material.dart';
import 'package:localization_languages/UI/views/Home/home_view_model.dart';
import '../../../../app/app_constants.dart';


class InfoCardWidget extends StatelessWidget {
  final HomeViewModel vm;
  const InfoCardWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final loc = _AppLoc(vm);
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoRow(
              icon: '👤',
              label: loc.nameLabel,
              value: loc.name,
              valueColor: AppColors.accent,
            ),
            _Divider(),
            _InfoRow(
              icon: '🎂',
              label: loc.ageLabel,
              value: loc.ageValue,
            ),
            _Divider(),
            _InfoRow(
              icon: '💼',
              label: loc.roleLabel,
              value: loc.roleValue,
              valueColor: AppColors.accentSecondary,
            ),
            _Divider(),
            _InfoRow(
              icon: '📍',
              label: loc.nationalityLabel,
              value: loc.nationalityValue,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(icon, style: const TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 15,
                    color: valueColor ?? AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
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

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.cardBorder.withOpacity(0),
            AppColors.cardBorder,
            AppColors.cardBorder.withOpacity(0),
          ],
        ),
      ),
    );
  }
}

class _AppLoc {
  final HomeViewModel vm;
  _AppLoc(this.vm);

  String get name => _get('name');
  String get nameLabel => _get('nameLabel');
  String get ageLabel => _get('ageLabel');
  String get ageValue => _get('ageValue');
  String get roleLabel => _get('roleLabel');
  String get roleValue => _get('roleValue');
  String get nationalityLabel => _get('nationalityLabel');
  String get nationalityValue => _get('nationalityValue');

  String _get(String key) {
    final code = vm.currentLocale.languageCode;
    return _t[code]?[key] ?? _t['en']![key]!;
  }

  static const Map<String, Map<String, String>> _t = {
    'en': {
      'name': 'Hammad Nasir',
      'nameLabel': 'Name',
      'ageLabel': 'Age',
      'ageValue': '18 Years Old',
      'roleLabel': 'Role',
      'roleValue': 'Student & Flutter Developer',
      'nationalityLabel': 'Nationality',
      'nationalityValue': 'Karachi, Pakistan 🇵🇰',
    },
    'ur': {
      'name': 'حماد ناصر',
      'nameLabel': 'نام',
      'ageLabel': 'عمر',
      'ageValue': '18 سال',
      'roleLabel': 'کردار',
      'roleValue': 'طالب علم اور فلٹر ڈویلپر',
      'nationalityLabel': 'قومیت',
      'nationalityValue': 'کراچی، پاکستان 🇵🇰',
    },
    'de': {
      'name': 'Hammad Nasir',
      'nameLabel': 'Name',
      'ageLabel': 'Alter',
      'ageValue': '18 Jahre alt',
      'roleLabel': 'Rolle',
      'roleValue': 'Student & Flutter-Entwickler',
      'nationalityLabel': 'Nationalität',
      'nationalityValue': 'Karatschi, Pakistan 🇵🇰',
    },
    'zh': {
      'name': '哈马德·纳西尔',
      'nameLabel': '姓名',
      'ageLabel': '年龄',
      'ageValue': '18岁',
      'roleLabel': '职位',
      'roleValue': '学生 & Flutter开发者',
      'nationalityLabel': '国籍',
      'nationalityValue': '巴基斯坦卡拉奇 🇵🇰',
    },
  };
}