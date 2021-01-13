import 'package:bmw_design/screens/car_info_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bmw_design/widgets/car.dart';

//Car UID hardcoded for CloudFireStore access. Will be changed when car selected in homepage
class CarInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final carSelected = db.collection('cars').doc('akEEYmWJ5SCYmQ8mYD7T');

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

            if (snapshot.hasData) {
              id = "akEEYmWJ5SCYmQ8mYD7T";
              title = snapshot.data["title"];
              name = snapshot.data["name"];
              model = snapshot.data["model"];
              description = snapshot.data["description"];
              photoUrl = snapshot.data["photo"];
            } else {
              return Center(child: CircularProgressIndicator());
            }

            return CarInfoScreen(
                car: Car(
                    id, title, name, model, description, photoUrl, carSpecs));
          }),
    );
  }
}
