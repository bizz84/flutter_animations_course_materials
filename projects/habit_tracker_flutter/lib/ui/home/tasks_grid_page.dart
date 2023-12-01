import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/app_theme_settings.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/ui/home/home_page_bottom_options.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/sliding_panel.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/theme_selection_close.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/theme_selection_list.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class TasksGridPage extends StatelessWidget {
  const TasksGridPage({
    super.key,
    required this.tasks,
    this.onFlip,
  });
  final List<Task> tasks;
  final VoidCallback? onFlip;

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
            ),
            const Positioned(
              bottom: 6,
              left: 0,
              width: SlidingPanel.leftPanelFixedWidth,
              child: SlidingPanel(
                direction: SlideDirection.leftToRight,
                child: ThemeSelectionClose(),
              ),
            ),
            Positioned(
              bottom: 6,
              right: 0,
              width: MediaQuery.of(context).size.width -
                  SlidingPanel.leftPanelFixedWidth,
              child: SlidingPanel(
                direction: SlideDirection.rightToLeft,
                child: ThemeSelectionList(
                  currentThemeSettings:
                      AppThemeSettings(colorIndex: 0, variantIndex: 0),
                  availableWidth: MediaQuery.of(context).size.width -
                      SlidingPanel.leftPanelFixedWidth -
                      SlidingPanel.paddingWidth,
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
    super.key,
    required this.tasks,
    this.onFlip,
  });
  final List<Task> tasks;
  final VoidCallback? onFlip;

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
        ),
      ],
    );
  }
}
