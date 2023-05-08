import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/app_assets.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';
import 'package:habit_tracker_flutter/constants/text_styles.dart';
import 'package:habit_tracker_flutter/models/front_or_back_side.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/ui/add_task/add_task_navigator.dart';
import 'package:habit_tracker_flutter/ui/task/task_with_name.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OnboardingPage extends StatelessWidget {
  Future<void> _addTask(BuildContext context, AppThemeData appThemeData) async {
    await showCupertinoModalBottomSheet<void>(
      context: context,
      barrierColor: AppColors.black50,
      builder: (_) => AppTheme(
        data: appThemeData,
        child: AddTaskNavigator(frontOrBackSide: FrontOrBackSide.front),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const size = 150.0;
    final padding = (MediaQuery.of(context).size.width - size) / 2;
    // * This page only shows on app startup until the first task is added,
    // * so it's ok to choose a default swatch and app theme.
    // * The user will be able to customize this later.
    const defaultColorSwatch = AppColors.red;
    final defaultAppThemeVariants = AppThemeVariants(defaultColorSwatch);
    final appThemeData = defaultAppThemeVariants.themes[0];
    return AppTheme(
      data: appThemeData,
      child: Scaffold(
        backgroundColor: defaultColorSwatch[0],
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add a task to begin.',
                style: TextStyles.heading.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 128,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: TaskWithName(
                  task: Task(
                    id: '',
                    name: 'Tap and hold\nto add a task',
                    iconName: AppAssets.plus,
                  ),
                  hasCompletedState: false,
                  onCompleted: (completed) => _addTask(context, appThemeData),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
