import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      title: 'My App which needs login',
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFF26203E), Color(0xFF413972)],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'User Profile',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          child: Text(
                            'User: ${user.email}\n UID: ${user.uid}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 150),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            color: Color(0xFFBE144D),
                            textColor: Colors.white,
                            child: Text('Logout'),
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                          ),
                        ),
                        SizedBox(height: 150),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_rounded),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
