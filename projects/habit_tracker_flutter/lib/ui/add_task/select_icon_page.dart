import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/app_assets.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';
import 'package:habit_tracker_flutter/constants/text_styles.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/app_bar_icon_button.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/centered_svg_icon.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class SelectIconPage extends StatelessWidget {
  const SelectIconPage({Key? key, required this.selectedIconName})
      : super(key: key);
  final String selectedIconName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).secondary,
        leading: AppBarIconButton(
          iconName: AppAssets.navigationClose,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Select Icon',
          style: TextStyles.heading.copyWith(
            color: AppTheme.of(context).settingsText,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: AppTheme.of(context).primary,
      body: SelectIconGrid(
        selectedIconName: selectedIconName,
        onSelectedIcon: (iconName) => Navigator.of(context).pop(iconName),
      ),
    );
  }
}

class SelectIconGrid extends StatefulWidget {
  const SelectIconGrid(
      {Key? key, required this.selectedIconName, this.onSelectedIcon})
      : super(key: key);
  final String selectedIconName;
  final ValueChanged<String>? onSelectedIcon;
  @override
  _SelectIconGridState createState() => _SelectIconGridState();
}

class _SelectIconGridState extends State<SelectIconGrid> {
  late String _selectedIconName = widget.selectedIconName;

  void _select(String selectedIconName) {
    // * If the currently selected icon is chosen again
    if (_selectedIconName == selectedIconName) {
      // * call the callback, which will dismiss the page and return the icon name
      widget.onSelectedIcon?.call(selectedIconName);
    } else {
      // * Otherwise update the state (but don't call anything just yet)
      setState(() => _selectedIconName = selectedIconName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final iconName = AppAssets.allTaskIcons[index];
        return SelectTaskIcon(
          iconName: iconName,
          isSelected: _selectedIconName == iconName,
          onPressed: () => _select(iconName),
        );
      },
      itemCount: AppAssets.allTaskIcons.length,
    );
  }
}

class SelectTaskIcon extends StatelessWidget {
  const SelectTaskIcon({
    Key? key,
    required this.iconName,
    required this.isSelected,
    this.onPressed,
  }) : super(key: key);
  final String iconName;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? AppTheme.of(context).accent
              : AppTheme.of(context).settingsInactiveIconBackground,
        ),
        child: CenteredSvgIcon(
          iconName: iconName,
          color: isSelected
              ? AppTheme.of(context).accentNegative
              : AppColors.white,
        ),
      ),
    );
  }
}
