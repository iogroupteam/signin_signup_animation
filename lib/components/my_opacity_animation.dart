import 'package:flutter/material.dart';

class MyOpacityAnimation extends StatefulWidget {
  Widget? child;
  int? duration;
  Curve? curve;
  MyOpacityAnimation({
    super.key,
    this.child,
    this.duration = 800,
    this.curve = Curves.fastOutSlowIn,
  });

  @override
  State<MyOpacityAnimation> createState() => _MyOpacityAnimationState();
}

class _MyOpacityAnimationState extends State<MyOpacityAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration!));
    animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller!, curve: widget.curve!));

    controller!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
        return Opacity(opacity: animation!.value, child: widget.child);
      },
    );
  }
}
