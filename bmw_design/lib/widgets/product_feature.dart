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
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/buttons/circleImage.jpg'),
        ),
        border: Border.all(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(8),
      // Text(
      //   '$value $units',
      //   style: TextStyle(
      //     fontSize: 10,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
    );
  }
}
