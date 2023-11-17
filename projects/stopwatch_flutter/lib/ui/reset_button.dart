import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.grey[900], // button color
        child: InkWell(
          onTap: onPressed,
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Reset',
            ),
          ),
        ),
      ),
    );
  }
}
