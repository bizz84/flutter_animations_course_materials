import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';
import 'package:habit_tracker_flutter/constants/text_styles.dart';
import 'package:habit_tracker_flutter/models/task_preset.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/chevron_icon.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/selectable_tile.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class TaskPresetListTile extends StatelessWidget {
  const TaskPresetListTile({
    Key? key,
    required this.taskPreset,
    this.showChevron = true,
    this.onPressed,
  }) : super(key: key);
  final TaskPreset taskPreset;
  final bool showChevron;
  final ValueChanged<TaskPreset>? onPressed;

  @override
  Widget build(BuildContext context) {
    return SelectableTile(
      onPressed: () => onPressed?.call(taskPreset),
      builder: (context, isSelected) => Container(
        color: isSelected
            ? AppTheme.of(context).secondary.withOpacity(0.5)
            : AppTheme.of(context).secondary,
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.of(context).settingsListIconBackground,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              taskPreset.iconName,
              color: AppColors.white,
              width: 24,
              height: 24,
            ),
          ),
          title: Text(
            taskPreset.name,
            style: TextStyles.content.copyWith(
              color: AppTheme.of(context).settingsText,
            ),
          ),
          trailing: showChevron
              ? ChevronIcon(color: AppTheme.of(context).accent)
              : null,
        ),
      ),
    );
  }
}
