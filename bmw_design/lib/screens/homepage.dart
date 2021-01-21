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
    Specs('speedPhoto.jpg', '- 60', 0),
    Specs('wheelPhoto.png', 'MPH', 175),
  ];

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final firebaseCars = db.collection('cars');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomePage',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF151828),
        accentColor: Color(0xFF151828),
      ),
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
            backgroundColor: Color(0xFF151828),
            body: Stack(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(30),
                    itemCount: snapshot.data.docs.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemBuilder: (context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFBE144D),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              snapshot.data.docs[index].get('photo'),
                            ),
                          ),
                          color: Color(0xFFBE144D),
                        ),
                        height: 100,
                        child: ListTile(
                          title: Text(
                            snapshot.data.docs[index].get('brand'),
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle:
                              Text(snapshot.data.docs[index].get('model')),
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
