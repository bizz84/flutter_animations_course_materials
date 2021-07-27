import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton(
      {Key? key, required this.iconName, required this.onPressed})
      : super(key: key);
  final String iconName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconName,
        color: AppTheme.of(context).settingsText,
        width: 20,
        height: 20,
      ),
    );
  }
}
