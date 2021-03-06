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
    return Stack(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            child: Image.asset(
              'assets/buttons/$image',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 150,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$value $units',
                style: TextStyle(
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
