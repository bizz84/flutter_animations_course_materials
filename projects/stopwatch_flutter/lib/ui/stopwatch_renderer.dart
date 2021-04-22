import 'package:flutter/material.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({
    super.key,
    required this.elapsed,
    required this.radius,
  });
  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.orange),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        // ElapsedTimeText(
        //   elapsed: elapsed,
        // ),
      ],
    );
  }
}
