import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';

class ThemeSelectionDots extends StatelessWidget {
  const ThemeSelectionDots({super.key, required this.selectedVariantIndex});
  final int selectedVariantIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ThemeSelectionDot(isSelected: selectedVariantIndex == 0),
        const SizedBox(width: 2.0),
        ThemeSelectionDot(isSelected: selectedVariantIndex == 1),
        const SizedBox(width: 2.0),
        ThemeSelectionDot(isSelected: selectedVariantIndex == 2),
      ],
    );
  }
}

class ThemeSelectionDot extends StatelessWidget {
  const ThemeSelectionDot({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.white : AppColors.white60,
      ),
    );
  }
}
