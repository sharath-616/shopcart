import 'package:flutter/material.dart';

class JustaddForusers extends StatelessWidget {
  final String addText;
  final double? addSize;
  final FontWeight? addfw;
  final double? addspace;
  final Color? addColor;
  final IconData? icon;
  const JustaddForusers({
    super.key,
    required this.addText,
    this.addSize,
    this.addfw,
    this.addspace,
    this.addColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: Colors.red,
              size: 15,
            ),
            Text(
              addText,
              style: TextStyle(
                color: addColor,
                fontSize: addSize,
                fontWeight: addfw,
                letterSpacing: addspace,
              ),
            )
          ],
        ));
  }
}
