import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';
import 'package:habit_tracker_flutter/constants/text_styles.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/chevron_icon.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.initialValue = '',
    this.hintText = '',
    this.showChevron = false,
    this.onSubmit,
  });
  final String initialValue;
  final String hintText;
  final bool showChevron;
  final ValueChanged<String>? onSubmit;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;

  String get text => _controller.value.text;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  void _clearText() {
    _controller.clear();
    // * This empty call to setState forces a rebuild which will hide the chevron.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).secondary,
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              // * This empty call to setState forces a rebuild which may show/hide the chevron.
              onChanged: (value) => setState(() {}),
              onSubmitted: (value) => widget.onSubmit?.call(value),
              controller: _controller,
              cursorColor: AppTheme.of(context).settingsText,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              style: TextStyles.content.copyWith(
                color: AppTheme.of(context).settingsText,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyles.content.copyWith(
                    color: AppTheme.of(context).settingsText.withOpacity(0.4)),
                suffixIcon: text.isNotEmpty
                    ? IconButton(
                        onPressed: _clearText,
                        icon: Icon(
                          Icons.cancel,
                          color: AppTheme.of(context).settingsText,
                        ),
                      )
                    : null,
                // * https://stackoverflow.com/questions/56315495/how-to-remove-underline-below-textfield
                border: InputBorder.none,
              ),
            ),
          ),
          if (text.isNotEmpty && widget.showChevron)
            Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
              color: AppTheme.of(context).settingsListIconBackground,
              child: IconButton(
                onPressed: () => widget.onSubmit?.call(text),
                icon: const ChevronIcon(
                  color: AppColors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
