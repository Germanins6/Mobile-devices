import 'package:bmw_design/screens/car_info_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Specs {
  String image, units;
  num value;
  Specs(this.image, this.units, this.value);
}

class Car {
  String id;
  String title;
  String name;
  String model;
  String description;
  String photoUrl;
  List<Specs> carSpecs;

  Car(String g_id, String g_title, String g_name, String g_model,
      String g_description, String g_photo, List<Specs> g_carSpecs) {
    id = g_id;
    title = g_title;
    name = g_name;
    model = g_model;
    description = g_description;
    photoUrl = g_photo;
    carSpecs = g_carSpecs;
  }
}

final carUid = 'akEEYmWJ5SCYmQ8mYD7T';

class CarInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final carSelected = db.collection('cars').doc('akEEYmWJ5SCYmQ8mYD7T');
    print(carSelected.id);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: carSelected.snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            String id;
            String title;
            String name;
            String model;
            String description;
            String photoUrl;
            List<Specs> carSpecs = [
              Specs('buttonImage.jpg', '- 60', 0),
              Specs('Button2Image.png', 'MPH', 175),
            ];
            print(snapshot.hasData);
            if (snapshot.hasData) {
              id = "akEEYmWJ5SCYmQ8mYD7T";
              title = snapshot.data["title"];
              name = snapshot.data["name"];
              model = snapshot.data["model"];
              description = snapshot.data["description"];
              photoUrl = snapshot.data["photo"];
            }
            return CarInfoScreen(
                car: Car(
                    id, title, name, model, description, photoUrl, carSpecs));
          }),
    );
  }
}
