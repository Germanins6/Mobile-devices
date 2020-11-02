import 'package:flutter/material.dart';

class ProductFeature extends StatelessWidget {
  final String iconName;
  final num value;
  final String units;
  const ProductFeature({
    @required this.iconName,
    @required this.value,
    @required this.units,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/icons/$iconName.png'),
          Text(
            '$value $units',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
