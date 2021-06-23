import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/app_theme_settings.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/ui/home/home_page_bottom_options.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/sliding_panel.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/sliding_panel_animator.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/theme_selection_close.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/theme_selection_list.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class TasksGridPage extends StatelessWidget {
  const TasksGridPage({
    Key? key,
    required this.leftAnimatorKey,
    required this.rightAnimatorKey,
    required this.tasks,
    this.onFlip,
    required this.themeSettings,
    this.onColorIndexSelected,
    this.onVariantIndexSelected,
  }) : super(key: key);
  final GlobalKey<SlidingPanelAnimatorState> leftAnimatorKey;
  final GlobalKey<SlidingPanelAnimatorState> rightAnimatorKey;
  final List<Task> tasks;
  final VoidCallback? onFlip;
  final AppThemeSettings themeSettings;
  final ValueChanged<int>? onColorIndexSelected;
  final ValueChanged<int>? onVariantIndexSelected;

  void _enterEditMode() {
    leftAnimatorKey.currentState?.slideIn();
    rightAnimatorKey.currentState?.slideIn();
  }

  void _exitEditMode() {
    leftAnimatorKey.currentState?.slideOut();
    rightAnimatorKey.currentState?.slideOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: SafeArea(
        child: Stack(
          children: [
            TasksGridContents(
              tasks: tasks,
              onFlip: onFlip,
              onEnterEditMode: _enterEditMode,
            ),
            Positioned(
              bottom: 6,
              left: 0,
              width: SlidingPanel.leftPanelFixedWidth,
              child: SlidingPanelAnimator(
                key: leftAnimatorKey,
                direction: SlideDirection.leftToRight,
                child: ThemeSelectionClose(
                  onClose: _exitEditMode,
                ),
              ),
            ),
            Positioned(
              bottom: 6,
              right: 0,
              width: MediaQuery.of(context).size.width -
                  SlidingPanel.leftPanelFixedWidth,
              child: SlidingPanelAnimator(
                key: rightAnimatorKey,
                direction: SlideDirection.rightToLeft,
                child: ThemeSelectionList(
                  currentThemeSettings: themeSettings,
                  availableWidth: MediaQuery.of(context).size.width -
                      SlidingPanel.leftPanelFixedWidth -
                      SlidingPanel.paddingWidth,
                  onColorIndexSelected: onColorIndexSelected,
                  onVariantIndexSelected: onVariantIndexSelected,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TasksGridContents extends StatelessWidget {
  const TasksGridContents({
    Key? key,
    required this.tasks,
    this.onFlip,
    this.onEnterEditMode,
  }) : super(key: key);
  final List<Task> tasks;
  final VoidCallback? onFlip;
  final VoidCallback? onEnterEditMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: TasksGrid(
              tasks: tasks,
            ),
          ),
        ),
        HomePageBottomOptions(
          onFlip: onFlip,
          onEnterEditMode: onEnterEditMode,
        ),
      ],
    );
  }
}
