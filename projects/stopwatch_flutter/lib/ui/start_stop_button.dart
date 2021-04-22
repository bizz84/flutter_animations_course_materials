import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({Key? key, required this.isRunning, this.onPressed})
      : super(key: key);
  final bool isRunning;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: isRunning ? Colors.red[900] : Colors.green[900], // button color
        child: InkWell(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              isRunning ? 'Stop' : 'Start',
            ),
          ),
        ),
      ),
    );
  }
}
