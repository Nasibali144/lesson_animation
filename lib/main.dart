import 'package:flutter/material.dart';
import 'package:lesson_animation/pages/splash_page.dart';

import 'animations/implicit_animations/animated_container.dart';
import 'animations/implicit_animations/dance_animated_container.dart';
import 'animations/library_and_custom_animations/bounce_animation.dart';
import 'animations/library_and_custom_animations/fade_animation.dart';
import 'animations/library_and_custom_animations/flip_animation.dart';
import 'animations/library_and_custom_animations/hinge_animation.dart';
import 'animations/library_and_custom_animations/pulse_animation.dart';
import 'animations/library_and_custom_animations/slide_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HingeAnimation(),
    );
  }
}