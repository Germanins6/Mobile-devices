//Buy screen

//import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
//import 'package:bmw_design/widgets/car.dart';

class BuyCar extends StatefulWidget {
  @override
  _BuyCarState createState() => _BuyCarState();
}

class _BuyCarState extends State<BuyCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1b2139),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 5,
                child: BuyCarPreview(),
              ),
              Expanded(
                flex: 6,
                child: BuyCarInfo(),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuyCarPreview extends StatefulWidget {
  // final Car car;
  // BuyCarPreview({this.car});
  @override
  _BuyCarPreviewState createState() => _BuyCarPreviewState();
}

class _BuyCarPreviewState extends State<BuyCarPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/headerPic.jpg',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}

class BuyCarInfo extends StatefulWidget {
  @override
  _BuyCarInfoState createState() => _BuyCarInfoState();
}

class _BuyCarInfoState extends State<BuyCarInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(
                "Car Name",
                style: TextStyle(
                  fontFamily: 'AdventProL',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                "Model, Manufacturer",
                style: TextStyle(
                  fontFamily: 'AdventProL',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Color: ",
                    style: TextStyle(
                      fontFamily: 'AdventProL',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.centerRight,
              width: 10,
              height: 50,
              child: Text(
                "999,99 €",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 150,
                height: 50,
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {},
                  child: Text(
                    "BUY NOW",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //Car Name
    //Model
    //Price
  }
}
