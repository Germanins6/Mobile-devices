import 'package:bmw_design/screens/car_info_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  List<Specs> carSpecs;

  Car(
    this.title,
    this.name,
    this.model,
    this.description,
    this.photoUrl,
    this.carSpecs,
  );
}

final carSelected = FirebaseFirestore.instance.collection("cars");

final bmw = Car(
  'YOUR VISION',
  'BMW',
  'I8 SHADOW EDITION',
  'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, '
      'SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA '
      'ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION '
      'ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.',
  'assets/headerPic.jpg',
  [
    Specs('buttonImage.jpg', '- 60', 0),
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
