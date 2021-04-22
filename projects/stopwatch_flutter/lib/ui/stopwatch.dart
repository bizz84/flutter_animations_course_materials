import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text_basic.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  @override
  Widget build(BuildContext context) {
    return ElapsedTimeTextBasic(
      elapsed: Duration(seconds: 5),
    );
  }
}
