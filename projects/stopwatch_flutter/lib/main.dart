import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stopwatch_flutter/ui/stopwatch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var brightness = Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:
          brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MyHomePage(
        onThemeToggle: () => setState(() => brightness =
            brightness == Brightness.dark ? Brightness.light : Brightness.dark),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.onThemeToggle}) : super(key: key);
  final VoidCallback onThemeToggle;
  @override
  Widget build(BuildContext context) {
    final useNightMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          useNightMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: AspectRatio(
                  aspectRatio: 0.85,
                  child: Stopwatch(),
                ),
              ),
            ),
            Positioned.fill(
              top: 64,
              child: Align(
                alignment: Alignment.topCenter,
                child: ThemeToggleButton(
                  onToggle: this.onThemeToggle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({Key? key, required this.onToggle}) : super(key: key);
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final useNightMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    final assetName = useNightMode ? 'toggle-day' : 'toggle-night';
    return GestureDetector(
      onTap: onToggle,
      child: Image.asset('assets/$assetName.png'),
    );
  }
}
