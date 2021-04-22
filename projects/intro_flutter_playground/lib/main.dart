import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/animated_container_page.dart';
import 'pages/animated_opacity_page.dart';
import 'pages/tween_animation_builder_page.dart';

enum AnimationExample {
  animatedContainer,
  animatedOpacity,
  tweenAnimationBuilder,
}

extension on AnimationExample {
  String capitalizeFirstCharacter() {
    final name = describeEnum(this);
    return name.replaceRange(0, 1, name.characters.first.toUpperCase());
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Animations Playground')),
        body: AnimationExamplesList(),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'animatedContainer':
            return MaterialPageRoute(builder: (_) => AnimatedContainerPage());
          case 'animatedOpacity':
            return MaterialPageRoute(builder: (_) => AnimatedOpacityPage());
          case 'tweenAnimationBuilder':
            return MaterialPageRoute(
                builder: (_) => TweenAnimationBuilderPage());
          default:
            throw UnimplementedError('Route ${settings.name} not implemented');
        }
      },
    );
  }
}

class AnimationExamplesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final example = AnimationExample.values[index];
        final routeName = describeEnum(example);
        return ListTile(
          title: Text(example.capitalizeFirstCharacter()),
          trailing: Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).pushNamed(routeName),
        );
      },
      itemCount: AnimationExample.values.length,
    );
  }
}
