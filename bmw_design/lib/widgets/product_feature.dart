import 'package:flutter/material.dart';

class ShowSpecs extends StatelessWidget {
  final String image, units;
  final num value;
  const ShowSpecs({
    @required this.image,
    @required this.units,
    @required this.value,
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
          Image.asset('assets/buttons/$image.png'),
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
