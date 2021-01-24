import 'package:bmw_design/screens/car_info_screen.dart';
import 'package:bmw_design/widgets/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Specs> carSpecs;

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
                Column(
                  children: [
                    SafeArea(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: IconButton(
                            icon: Icon(Icons.account_circle),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(30),
                        itemCount: snapshot.data.docs.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemBuilder: (context, int index) {
                          return Container(
                            decoration: BoxDecoration(
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
                                        snapshot.data.docs[index]
                                            .get('buy photo'),
                                        snapshot.data.docs[index]
                                            .get('brandLogo'),
                                        carSpecs = [
                                          Specs(
                                            'speedPhoto.jpg',
                                            'Km/h',
                                            snapshot.data.docs[index]
                                                .get('max velocity'),
                                            snapshot.data.docs[index]
                                                .get('max velocity'),
                                          ),
                                          Specs(
                                              'wheelPhoto.png',
                                              'CV',
                                              snapshot.data.docs[index]
                                                  .get('power'),
                                              snapshot.data.docs[index]
                                                  .get('power')),
                                        ],
                                        snapshot.data.docs[index].get('price'),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
