import 'package:bmw_design/screens/car_info_screen.dart';
import 'package:bmw_design/widgets/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Specs> carSpecs = [
    Specs('buttonImage.jpg', '- 60', 0),
    Specs('Button2Image.png', 'MPH', 175),
  ];

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final firebaseCars = db.collection('cars');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomePage',
      home: StreamBuilder(
        stream: firebaseCars.snapshots(),
        builder: (context, snapshot) {
          //Handle error
          if (snapshot.hasError) {
            return Container(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          //Handle time loading data
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
            body: Stack(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: snapshot.data.docs.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemBuilder: (context, int index) {
                      return Card(
                        color: Colors.redAccent,
                        child: ListTile(
                          trailing: Image.network(
                              snapshot.data.docs[index].get('photo')),
                          title: Text(snapshot.data.docs[index].get('brand') +
                              " " +
                              snapshot.data.docs[index].get('model')),
                          onTap: () {
                            print(snapshot.data.docs[index].get('model'));
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CarInfoScreen(
                                  car: Car(
                                    snapshot.data.docs[index].id,
                                    snapshot.data.docs[index].get('brand'),
                                    snapshot.data.docs[index].get('model'),
                                    snapshot.data.docs[index]
                                        .get('description'),
                                    snapshot.data.docs[index].get('photo'),
                                    carSpecs,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
