import 'package:flutter/material.dart';

class ColorSample extends StatelessWidget {
  final Color color;
  final String colorName;
  final bool selected;
  ColorSample({
    @required this.color,
    @required this.colorName,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    double size = 11;
    if (selected) size = 17;
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: selected ? 2 : 0,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          colorName,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
