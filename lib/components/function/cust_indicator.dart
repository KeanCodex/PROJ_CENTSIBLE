import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAnimatedIndicator extends StatelessWidget {
  CustomAnimatedIndicator({
    super.key,
    required this.initial,
    required this.count,
    required this.curve,
    required this.duration,
    required this.gap,
    required this.color,
    required this.size,
    required this.activeColor,
    required this.activeWidth,
  });
  Size size;

  int initial;
  int count;
  double gap;
  Duration duration;
  Curve curve;
  Color color;
  Color activeColor;
  double activeWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        count,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: gap),
          child: AnimatedContainer(
            curve: curve,
            duration: duration,
            width: index == initial ? size.width * activeWidth : size.width,
            height: index == initial ? size.height : size.height,
            decoration: BoxDecoration(
                color: index == initial ? activeColor : color,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
          ),
        ),
      ),
    );
  }
}
