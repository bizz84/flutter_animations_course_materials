import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton(
      {super.key, required this.iconName, required this.onPressed});
  final String iconName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconName,
        colorFilter: ColorFilter.mode(
          AppTheme.of(context).settingsText,
          BlendMode.srcIn,
        ),
        width: 20,
        height: 20,
      ),
    );
  }
}
