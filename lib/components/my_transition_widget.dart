import 'package:flutter/material.dart';

class MyTransitionWidget extends StatefulWidget {
  final Widget? child;
  final double? offset;
  final int? duration;
  final Curve? curve;
  final Axis? axis;
  VoidCallback? ontap;

  MyTransitionWidget({
    super.key,
    this.child,
    this.offset = 140.0,
    this.duration = 800,
    this.curve = Curves.elasticOut,
    this.axis = Axis.horizontal,
    this.ontap,
  });

  @override
  State<MyTransitionWidget> createState() => _MyTransitionWidgetState();
}

class _MyTransitionWidgetState extends State<MyTransitionWidget> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: widget.duration!),
      tween: Tween(begin: 1.0, end: 0.0),
      curve: widget.curve!,
      builder: (context, value, child) {
        return Transform.translate(
          offset: widget.axis == Axis.horizontal
              ? Offset(value * widget.offset!, 0.0)
              : Offset(0.0, value * widget.offset!),
          child: widget.child,
        );
      },
    );
  }
}
