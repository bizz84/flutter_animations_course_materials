import 'package:flutter/material.dart';

class PageFlipBuilder extends StatefulWidget {
  const PageFlipBuilder({
    super.key,
    required this.frontBuilder,
    required this.backBuilder,
  });
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  PageFlipBuilderState createState() => PageFlipBuilderState();
}

class PageFlipBuilderState extends State<PageFlipBuilder> {
  void flip() {
    // TODO: Update state
    debugPrint('flip called');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: call frontBuilder or backBuilder depending on some state
    return widget.frontBuilder(context);
  }
}
