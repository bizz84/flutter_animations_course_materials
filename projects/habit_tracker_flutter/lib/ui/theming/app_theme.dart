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

  static AppThemeData lerp(AppThemeData a, AppThemeData b, double t) {
    final overlayStyle = t < 0.5 ? a.overlayStyle : b.overlayStyle;
    return AppThemeData(
      primary: Color.lerp(a.primary, b.primary, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      accent: Color.lerp(a.accent, b.accent, t)!,
      accentNegative: Color.lerp(a.accentNegative, b.accentNegative, t)!,
      taskRing: Color.lerp(a.taskRing, b.taskRing, t)!,
      taskIcon: Color.lerp(a.taskIcon, b.taskIcon, t)!,
      settingsText: Color.lerp(a.settingsText, b.settingsText, t)!,
      settingsLabel: Color.lerp(a.settingsLabel, b.settingsLabel, t)!,
      settingsCta: Color.lerp(a.settingsCta, b.settingsCta, t)!,
      settingsListIconBackground: Color.lerp(
          a.settingsListIconBackground, b.settingsListIconBackground, t)!,
      settingsInactiveIconBackground: Color.lerp(
          a.settingsInactiveIconBackground,
          b.settingsInactiveIconBackground,
          t)!,
      inactiveThemePanelRing:
          Color.lerp(a.inactiveThemePanelRing, b.inactiveThemePanelRing, t)!,
      overlayStyle: overlayStyle,
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

class AppThemeVariants {
  AppThemeVariants(List<Color> swatch)
      : themes = [
          AppThemeData(
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
          ),
          AppThemeData(
            primary: AppColors.white,
            secondary: AppColors.lightestGrey,
            accent: swatch[0],
            accentNegative: AppColors.white,
            taskRing: AppColors.lighterGrey,
            taskIcon: swatch[0],
            settingsText: swatch[0],
            settingsLabel: AppColors.darkText,
            settingsCta: swatch[0],
            settingsListIconBackground: swatch[0],
            settingsInactiveIconBackground: AppColors.grey,
            inactiveThemePanelRing: AppColors.white60,
            overlayStyle: SystemUiOverlayStyle.dark,
          ),
          AppThemeData(
            primary: AppColors.black,
            secondary: AppColors.darkestGrey,
            accent: swatch[0],
            accentNegative: AppColors.white,
            taskRing: AppColors.darkerGrey,
            taskIcon: AppColors.white,
            settingsText: AppColors.white,
            settingsLabel: AppColors.lightText,
            settingsCta: swatch[0],
            settingsListIconBackground: swatch[0],
            settingsInactiveIconBackground: AppColors.darkerGrey,
            inactiveThemePanelRing: AppColors.white60,
            overlayStyle: SystemUiOverlayStyle.light,
          ),
        ];

  final List<AppThemeData> themes;
}
