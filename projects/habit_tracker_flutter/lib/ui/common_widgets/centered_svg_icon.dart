import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CenteredSvgIcon extends StatelessWidget {
  const CenteredSvgIcon({Key? key, required this.iconName, required this.color})
      : super(key: key);
  final String iconName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isSvg = iconName.endsWith('.svg');
    final factor = isSvg ? 0.5 : 0.6;
    return FractionallySizedBox(
      widthFactor: factor,
      heightFactor: factor,
      child: isSvg
          ? SvgPicture.asset(
              iconName,
              color: color,
            )
          : FittedBox(
              child: Text(
                iconName.substring(0, 1),
                style: TextStyle(color: color),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
