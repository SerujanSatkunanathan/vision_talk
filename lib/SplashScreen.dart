import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:vision_talk/main.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlutterSplashScreen.gif(
        useImmersiveMode: true,
        gifPath: 'assets/splash.gif',
        gifWidth: 600,
        gifHeight: 600,
        nextScreen: const visionTalk(),
        duration: const Duration(milliseconds: 6900),
        onInit: () async {
          debugPrint("onInit");
        },
        onEnd: () async {
          debugPrint("onEnd 1");
        },
      ),
    );
  }
}
