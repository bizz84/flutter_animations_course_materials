import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/app_assets.dart';
import 'package:habit_tracker_flutter/constants/text_styles.dart';
import 'package:habit_tracker_flutter/models/task_preset.dart';
import 'package:habit_tracker_flutter/ui/add_task/add_task_navigator.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/app_bar_icon_button.dart';
import 'package:habit_tracker_flutter/ui/add_task/custom_text_field.dart';
import 'package:habit_tracker_flutter/ui/add_task/task_preset_list_tile.dart';
import 'package:habit_tracker_flutter/ui/add_task/text_field_header.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).secondary,
        leading: AppBarIconButton(
          iconName: AppAssets.navigationClose,
          // * Using `rootNavigator: true` to ensure we dismiss the entire navigation stack.
          // * Remember that we show this page inside [AddTaskNavigator],
          // * which already contains a [Navigator])
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
        title: Text(
          'Add Task',
          style: TextStyles.heading.copyWith(
            color: AppTheme.of(context).settingsText,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: AppTheme.of(context).primary,
      body: const AddTaskContents(),
    );
  }
}

class AddTaskContents extends StatelessWidget {
  const AddTaskContents({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const TextFieldHeader('CREATE YOUR OWN:'),
              CustomTextField(
                hintText: 'Enter task title...',
                showChevron: true,
                onSubmit: (value) => Navigator.of(context).pushNamed(
                  AddTaskRoutes.confirmTask,
                  arguments: TaskPreset(
                      iconName: value.substring(0, 1).toUpperCase(),
                      name: value),
                ),
              ),
              const SizedBox(height: 32),
              const TextFieldHeader('OR CHOOSE A PRESET:'),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => TaskPresetListTile(
              taskPreset: TaskPreset.allPresets[index],
              onPressed: (taskPreset) => Navigator.of(context).pushNamed(
                AddTaskRoutes.confirmTask,
                arguments: taskPreset,
              ),
            ),
            childCount: TaskPreset.allPresets.length,
          ),
        ),
        // Account for safe area
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          ),
        )
      ],
    );
  }
}
