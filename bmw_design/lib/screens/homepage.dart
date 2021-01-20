import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final firebaseCars = db.collection('cars');

    return MaterialApp(
      title: 'HomePage',
      home: StreamBuilder(
        stream: firebaseCars.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.docs.map((document) {
              return Center(
                child: Container(
                  child: Text(document['brand']),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
