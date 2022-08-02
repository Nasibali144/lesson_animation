import 'dart:math';
import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({Key? key}) : super(key: key);

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _animation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() {
    if(isFirst) {
      _controller.forward();
      setState(() {
        isFirst = false;
      });
    } else {
      _controller.reverse();
      setState(() {
        isFirst = true;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // #appbar
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bounce Animation"),
        backgroundColor: Colors.blueGrey.shade800,
      ),

      // #body
      body: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(2 * pi * _animation.value),
          child: const Icon(
            Icons.accessibility_new,
            color: Colors.deepPurple,
            size: 150,
          ),
        ),
      ),

      // #play
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade800,
        onPressed: _play,
        child: const Icon(
          Icons.play_arrow,
          size: 30,
        ),
      ),
    );
  }
}
