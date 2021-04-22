import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
    );
  }
}
