import 'package:flutter/material.dart';

class Sportpersonalcard extends StatelessWidget {
  final double w_mdof;
  final Color color;

  Sportpersonalcard({required this.w_mdof, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: w_mdof,
        height: 70.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 15.0),
              Text('1',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
              const SizedBox(width: 25.0),
              Expanded(
                  child: Text('contents',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600))),
              Icon(Icons.check, size: 25.0, color: Colors.grey),
              const SizedBox(width: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
