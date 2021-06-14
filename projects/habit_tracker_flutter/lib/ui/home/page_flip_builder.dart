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
  State<PageFlipBuilder> createState() => _PageFlipBuilderState();
}

class _PageFlipBuilderState extends State<PageFlipBuilder> {
  @override
  Widget build(BuildContext context) {
    // TODO: call frontBuilder or backBuilder depending on some state
    return widget.frontBuilder(context);
  }
}
