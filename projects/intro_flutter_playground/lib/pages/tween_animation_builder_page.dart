import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TweenAnimationBuilder'),
      ),
      body: Center(
        child: HSVColorSelector(),
      ),
    );
  }
}

class HSVColorSelector extends StatefulWidget {
  @override
  _HSVColorSelectorState createState() => _HSVColorSelectorState();
}

class _HSVColorSelectorState extends State<HSVColorSelector> {
  double _hue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
          duration: Duration(milliseconds: 1500),
          width: 200,
          height: 200,
        ),
        SizedBox(height: 48.0),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 0.0,
            end: _hue,
          ),
          duration: Duration(milliseconds: 1500),
          builder: (context, hue, child) {
            final hsvColor = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);
            return Container(
              width: 200,
              height: 200,
              color: hsvColor.toColor(),
            );
          },
        ),
        SizedBox(height: 48.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 30.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  for (var h = 0.0; h < 360.0; h += 1)
                    HSVColor.fromAHSV(1.0, h, 1.0, 1.0).toColor()
                ],
                stops: [
                  for (var h = 0.0; h < 360.0; h += 1) h / 360.0,
                ],
              ),
            ),
          ),
        ),
        Slider.adaptive(
          value: _hue,
          min: 0,
          max: 360,
          onChanged: (newValue) => setState(() => _hue = newValue),
        ),
      ],
    );
  }
}
