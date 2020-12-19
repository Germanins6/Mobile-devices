/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmw_design/app.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final firebaseCars = db.collection('cars');

    return MaterialApp(
      title: 'HomePage',
      home: StreamBuilder(
        stream: firebaseCars.snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {},
      ),
    );
  }
}

class CarHomepage extends StatelessWidget {
  final Car car;
  CarHomepage({this.car});

  Widget _buildList(QuerySnapshot snapshot) {
    final db = FirebaseFirestore.instance;
    final carDocs = snapshot.docs;

    return ListView.builder(
      itemCount: carDocs.length,
      itemBuilder: (context, int index) {
        return ListTile(
          leading: ,
        );
      },
    );
  }

  return Scaffold(
    body: StreamBuilder(stream: db.collection('cars').doc(car.id).snapshots(),),
  );

}
*/
