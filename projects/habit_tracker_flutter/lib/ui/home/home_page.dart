import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/app_assets.dart';
import 'package:habit_tracker_flutter/models/task_preset.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: TasksGrid(
            tasks: [
              TaskPreset(
                  name: 'Eat a Healthy Meal', iconName: AppAssets.carrot),
              TaskPreset(name: 'Walk the Dog', iconName: AppAssets.dog),
              TaskPreset(name: 'Do Some Coding', iconName: AppAssets.html),
              TaskPreset(name: 'Meditate', iconName: AppAssets.meditation),
              TaskPreset(name: 'Do 10 Pushups', iconName: AppAssets.pushups),
              TaskPreset(name: 'Sleep 8 Hours', iconName: AppAssets.rest),
            ],
          ),
        ),
      ),
    );
  }
}
