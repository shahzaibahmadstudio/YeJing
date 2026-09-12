import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YeJingColors {
  // Major Palette
  static const Color primaryRed = Color(0xFFC8102E);
  static Color primaryRedWithAlpha = Color(0xFFC8102E).withAlpha(30);
  static const Color secondaryYellow = Color(0xFFFFD700);
  static const Color accentGreen = Color(0xFF5CA904);
  static Color accentGreenWithAlpha = Color(0xFF5CA904).withAlpha(92);
  static const Color accentMustard = Color(0xFF8D7F00);
  static const Color accentOrange = Color(0xFFFF9B29);
  static const Color background = Color(0xFFE5E5E5);

  //  WHITE AND ITS VARIATIONS
  static const Color pureWhite = Color(0xFFFFFFFF);
  static Color pureWhiteVariation = Color(0xFFD9D9D9).withAlpha(120);

  //  BLACK AND ITS VARIATIONS
  static const Color pureBlack = Color(0xFF000000);
  static Color pureBlackWithAlpha8 = Color(0xFF000000).withAlpha(20);
  static Color pureBlackWithAlpha24 = Color(0xFF000000).withAlpha(64);
  static Color pureBlackWithAlpha36 = Color(0xFF000000).withAlpha(92);
  static Color pureBlackWithAlpha72 = Color(0xFF000000).withAlpha(184);
}

class YeJingTextStyles {
  static final TextStyle n10 = GoogleFonts.nunito(
    color: YeJingColors.primaryRed,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
  static final TextStyle n12 = GoogleFonts.nunito(
    color: YeJingColors.primaryRed,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
  static final TextStyle n14 = GoogleFonts.nunito(
    color: YeJingColors.primaryRed,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  static final TextStyle n16 = GoogleFonts.nunito(
    color: YeJingColors.primaryRed,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static final TextStyle n18 = GoogleFonts.nunito(
    color: YeJingColors.primaryRed,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );
  static final TextStyle n20 = GoogleFonts.nunito(
    color: YeJingColors.primaryRed,
    fontWeight: FontWeight.w800,
    fontSize: 20,
  );
  static final TextStyle n24 = GoogleFonts.nunito(
    color: YeJingColors.primaryRed,
    fontWeight: FontWeight.w900,
    fontSize: 24,
  );
  static final TextStyle n28 = GoogleFonts.nunito(
    color: YeJingColors.primaryRed,
    fontWeight: FontWeight.w900,
    fontSize: 28,
  );
  static final TextStyle n34 = GoogleFonts.nunito(
    color: YeJingColors.primaryRed,
    fontWeight: FontWeight.w900,
    fontSize: 34,
  );
}

class YeJingImages {
  static const String logo = "assets/images/logo.png";
  static const String leaf = "assets/images/leaf.png";
}

class YeJingIcons {
  // Bottom Nav Icons
  static const String searchRounded = "assets/icons/search_rounded.svg";
  static const String history = "assets/icons/history.svg";
  static const String settings = "assets/icons/settings.svg";

  // Others
  static const String camera = "assets/icons/camera.svg";
  static const String delete = "assets/icons/delete.svg";
  static const String search = "assets/icons/search.svg";
}

extension ResponsiveScaler on BuildContext {
  static const double _baseWidth = 440.0;
  static const double _tabletBaseWidth = 835.0;
  static const double _maxDesignWidth = 500.0;

  bool get isTablet => MediaQuery.of(this).size.shortestSide >= 600;

  double get scale {
    final double width = MediaQuery.of(this).size.width;
    if (isTablet) {
      return width / _tabletBaseWidth;
    }
    final targetWidth = width > _maxDesignWidth ? _maxDesignWidth : width;
    return targetWidth / _baseWidth;
  }

  double s(double value) => value * scale;

  double sp(double value) => value * scale;
}
