import 'package:flutter/material.dart';
import 'screens/car_info_screen.dart';

class Specs {
  String image, units;
  num value;
  Specs(this.image, this.units, this.value);
}

class Car {
  String title;
  String name;
  String model;
  String description;
  String photoUrl;
  List<Specs> specs;

  Car(
    this.title,
    this.name,
    this.model,
    this.description,
    this.photoUrl,
    this.specs,
  );
}

final bmw = Car(
  'YOUR VISION',
  'BMW',
  'I8 SHADOW EDITION',
  'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, '
      'SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA '
      'ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION '
      'ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS'
      'AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM'
      'DOLORE EU FUGIAT NULLA PARIATUR.',
  'assets/headerPic.jpg',
  [
    Specs('buttonImage.jpg', 'KM/H', 60),
    Specs('Button2Image.png', 'MPH', 175),
    Specs('button3Image.jpg', 'MPH', 175),
  ],
);

class CarInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarInfoScreen(
        car: bmw,
      ),
    );
  }
}
