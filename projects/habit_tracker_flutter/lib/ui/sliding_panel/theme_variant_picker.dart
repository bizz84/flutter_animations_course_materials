import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/theme_selection_dots.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class ThemeVariantPicker extends StatelessWidget {
  const ThemeVariantPicker(
      {Key? key,
      required this.color,
      required this.isSelected,
      required this.selectedVariantIndex,
      this.onColorSelected})
      : super(key: key);
  final Color color;
  final bool isSelected;
  final int selectedVariantIndex;
  final ValueChanged<Color>? onColorSelected;

  static const double size = 32.0;
  static const double padding = 4.0;
  static const double itemSize = size + padding * 2;

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.of(context);
    final borderColor = isSelected
        ? themeData.accentNegative
        : themeData.inactiveThemePanelRing;
    return GestureDetector(
      onTap: () => onColorSelected?.call(color),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(width: 3.0, color: borderColor),
          ),
          child: isSelected
              ? ThemeSelectionDots(selectedVariantIndex: selectedVariantIndex)
              : null,
        ),
      ),
    );
  }
}
