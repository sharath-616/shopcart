import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final double? letterSpacing;
  final Color? color;
  final FontWeight? fw;
  final String? fontFamily;

  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.letterSpacing,
    this.color,
    this.fw,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fw,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily,
      ),
    );
  }
}
