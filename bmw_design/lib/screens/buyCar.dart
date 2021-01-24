//Buy screen

//import 'package:flutter/cupertino.dart';

import 'package:bmw_design/widgets/car.dart';
import 'package:flutter/material.dart';

class BuyCar extends StatefulWidget {
  final Car cartobuy;
  BuyCar(this.cartobuy);
  @override
  _BuyCarState createState() => _BuyCarState();
}

class _BuyCarState extends State<BuyCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151828),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: BuyCarPreview(car: widget.cartobuy),
              ),
              Expanded(
                flex: 6,
                child: BuyCarInfo(car: widget.cartobuy),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyCarPreview extends StatefulWidget {
  final Car car;
  BuyCarPreview({this.car});
  @override
  _BuyCarPreviewState createState() => _BuyCarPreviewState();
}

class _BuyCarPreviewState extends State<BuyCarPreview> {
  final TextStyle style = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    fontFamily: 'Archivo',
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: Image.network(
            widget.car.buyPhoto,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                children: [
                  Text(
                    'HIRE',
                    style: style,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF1b2139),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BuyCarInfo extends StatefulWidget {
  Car car;
  BuyCarInfo({this.car});
  @override
  _BuyCarInfoState createState() => _BuyCarInfoState();
}

class _BuyCarInfoState extends State<BuyCarInfo> {
  bool buy = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              '${widget.car.brand}',
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
              '${widget.car.model}',
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
                    color: Color(0xFFBE144D),
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
              '${widget.car.price} €',
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
                color: Color(0xFFBE144D),
                onPressed: () {
                  buy = true;
                },
                child: _ButtonText(
                  buy: buy,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonText extends StatefulWidget {
  bool buy;
  _ButtonText({this.buy});

  @override
  __ButtonTextState createState() => __ButtonTextState();
}

class __ButtonTextState extends State<_ButtonText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.buy) {
      return Text(
        "BUY NOW",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      );
    } else {
      return Text(
        "IN PROPERTY",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      );
    }
  }
}
