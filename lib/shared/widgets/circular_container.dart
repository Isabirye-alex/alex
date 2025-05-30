import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key, required this.width, required this.height, required this.color, required this.radius});

  final double width;
  final double height;
  final Color color;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color
      ),
    );
  }
}
