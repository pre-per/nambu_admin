import 'package:flutter/material.dart';

class BottomBarDesign extends StatelessWidget {
  final String text;
  final Color color;

  const BottomBarDesign({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Center(
        child: Text(text,
            style:
            TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
