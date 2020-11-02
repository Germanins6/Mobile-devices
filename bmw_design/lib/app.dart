import 'package:flutter/material.dart';

import 'screens/lamp_info_screen.dart';

class Feature {
  String icon, units;
  num value;
  Feature(this.icon, this.units, this.value);
}

class Lamp {
  String name;
  double price;
  List<Feature> features;
  String description;
  String photoUrl;
  Color color;
  Lamp(
    this.name,
    this.description,
    this.price,
    this.photoUrl,
    this.features,
    this.color,
  );
}

final melodiLamp = Lamp(
  'Melodi',
  'Reprehenderit sit excepteur aliquip sit laboris consequat pariatur aliquip in anim laboris.',
  15.99,
  'assets/mainImage.jpg',
  [
    Feature('lamp', 'W', 22),
    Feature('hruler', 'cm', 28),
    Feature('vruler', 'cm', 26),
    Feature('plug', 'm', 1.6),
  ],
  Colors.amber,
);

class LampInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LampInfoScreen(
        lamp: melodiLamp,
      ),
    );
  }
}
