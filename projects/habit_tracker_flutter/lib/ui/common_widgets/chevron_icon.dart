import 'package:flutter/material.dart';

class ChevronIcon extends StatelessWidget {
  const ChevronIcon({super.key, required this.color});
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
