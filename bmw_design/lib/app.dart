import 'package:flutter/material.dart';
import 'screens/lamp_info_screen.dart';

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
  'YOUR VISION IS OUR NEXT INVETION',
  'BMW',
  'I8 SHADOW EDITION',
  'Mollit do adipisicing ut qui. Ea ad officia commodo est ea laborum commodo aute non. Adipisicing occaecat adipisicing voluptate sint quis quis eiusmod non officia laboris.',
  'assets/headerPic.jpg',
  [
    Specs('buttonImage.jpg', 'KM/H', 60),
    Specs('Button2Image.png', 'MPH', 175),
    Specs('button3Image.jpg', 'MPH', 175),
  ],
);

class LampInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarInfoScreen(
        car: bmw,
      ),
    );
  }
}
