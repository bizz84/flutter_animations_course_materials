import 'package:flutter/material.dart';

class ChevronIcon extends StatelessWidget {
  const ChevronIcon({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.chevron_right,
      color: color,
      size: 32,
    );
  }
}
