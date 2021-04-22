import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';

class AppThemeData {
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color accentNegative;
  final Color taskRing;
  final Color taskIcon;
  final Color settingsText;
  final Color settingsLabel;
  final Color settingsCta;
  final Color settingsListIconBackground;
  final Color settingsInactiveIconBackground;
  final Color inactiveThemePanelRing;
  final SystemUiOverlayStyle overlayStyle;

  AppThemeData({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.accentNegative,
    required this.taskRing,
    required this.taskIcon,
    required this.settingsText,
    required this.settingsLabel,
    required this.settingsCta,
    required this.settingsListIconBackground,
    required this.settingsInactiveIconBackground,
    required this.inactiveThemePanelRing,
    required this.overlayStyle,
  });

  factory AppThemeData.defaultWithSwatch(List<Color> swatch) {
    return AppThemeData(
      primary: swatch[0],
      secondary: swatch[1],
      accent: AppColors.white,
      accentNegative: AppColors.black,
      taskRing: swatch[4],
      taskIcon: AppColors.white,
      settingsText: AppColors.white,
      settingsLabel: AppColors.white60,
      settingsCta: swatch[3],
      settingsListIconBackground: swatch[2],
      settingsInactiveIconBackground: swatch[2],
      inactiveThemePanelRing: AppColors.grey,
      overlayStyle: SystemUiOverlayStyle.light,
    );
  }
}

// Class for reading AppThemeData via InheritedWidget
class AppTheme extends InheritedWidget {
  const AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (theme != null) {
      return theme.data;
    } else {
      throw StateError('Could not find ancestor widget of type `AppTheme`');
    }
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => data != oldWidget.data;
}
