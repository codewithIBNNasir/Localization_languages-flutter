import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette — Deep Tech Blue + Neon Accent
  static const Color primary = Color(0xFF0A0E27);
  static const Color secondary = Color(0xFF1A1F3C);
  static const Color accent = Color(0xFF00D4FF);
  static const Color accentSecondary = Color(0xFF7B2FFF);
  static const Color accentGold = Color(0xFFFFD700);

  static const Color cardBg = Color(0xFF141830);
  static const Color cardBorder = Color(0xFF252A4A);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B8D1);
  static const Color textMuted = Color(0xFF6B7394);

  static const Gradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A0E27), Color(0xFF1A1F3C), Color(0xFF0D1535)],
  );

  static const Gradient accentGradient = LinearGradient(
    colors: [Color(0xFF00D4FF), Color(0xFF7B2FFF)],
  );

  static const Gradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E2442), Color(0xFF141830)],
  );
}

class AppStrings {
  static const List<Map<String, String>> skills = [
    {'label': 'Flutter', 'icon': '💙'},
    {'label': 'Dart', 'icon': '🎯'},
    {'label': 'Firebase', 'icon': '🔥'},
    {'label': 'REST APIs', 'icon': '🌐'},
    {'label': 'Git', 'icon': '🔀'},
    {'label': 'UI/UX', 'icon': '🎨'},
  ];

  static const List<Map<String, dynamic>> languages = [
    {'name': 'English', 'flag': '🇬🇧', 'locale': Locale('en'), 'code': 'EN'},
    {'name': 'اردو', 'flag': '🇵🇰', 'locale': Locale('ur'), 'code': 'UR'},
    {'name': 'Deutsch', 'flag': '🇩🇪', 'locale': Locale('de'), 'code': 'DE'},
    {'name': '中文', 'flag': '🇨🇳', 'locale': Locale('zh'), 'code': 'ZH'},
  ];
}