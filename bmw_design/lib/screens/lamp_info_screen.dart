import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../app.dart';
import '../widgets/color_sample.dart';
import '../widgets/product_feature.dart';

class CarInfoScreen extends StatelessWidget {
  final Car bmw;
  CarInfoScreen({@required this.bmw, Car car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 4, child: _CarPreviewContainer(car: bmw)),
              Expanded(flex: 6, child: _CarInfo(car: bmw)),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: BackButton(),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _MenuButton(),
          )
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60.0 + 24,
      padding: EdgeInsets.fromLTRB(14, 14 + 24.0, 14, 14),
      child: Stack(
        children: [
          Center(
            child: Icon(Icons.menu),
          ),
          Align(
            alignment: Alignment(.8, -.8),
            child: Container(
              width: 9,
              height: 9,
            ),
          ),
        ],
      ),
    );
  }
}

class _CarInfo extends StatelessWidget {
  final Car car;
  _CarInfo({this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(flex: 1, child: _CarInfoTabs(car: bmw)),
            Expanded(flex: 8, child: _CarInfoBody(car: bmw)),
            Expanded(flex: 1, child: _CarInfoBottom()),
          ],
        )
      ],
    ));
  }
}

class _CarInfoTabs extends StatelessWidget {
  final Car car;
  _CarInfoTabs({this.car});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1b2139),
        ),
      ),
    );
  }
}

class _CarInfoBody extends StatelessWidget {
  final Car car;
  _CarInfoBody({this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Color(0xFF151828),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CarName(name: bmw.name),
          SizedBox(height: 6),
          _CarDescription(description: bmw.description),
          SizedBox(height: 16),
          _CarSpecs(car_specs: bmw.specs),
          //Spacer(),
        ],
      ),
    );
  }
}

class _CarInfoBottom extends StatelessWidget {
  _CarInfoBottom();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFF1b2139),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }
}

class _CarSpecs extends StatelessWidget {
  final List<Specs> car_specs;
  _CarSpecs({this.car_specs});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var feature in car_specs)
          ShowSpecs(
            //image: feature.image,
            units: feature.units,
            value: feature.value,
          ),
      ],
    );
  }
}

class _CarDescription extends StatelessWidget {
  final String description;
  _CarDescription({this.description});
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }
}

class _CarName extends StatelessWidget {
  final String name;
  _CarName({this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'MontserratAlternates',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8),
        Text(
          'Modelo',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'MontserratAlternates',
          ),
        ),
        Spacer(),
      ],
    );
  }
}

//Still developing widget
class _CarModel extends StatelessWidget {
  final String model;
  _CarModel({this.model});

  Widget build(BuildContext context) {}
}

class _CarPreviewContainer extends StatelessWidget {
  final Car car;
  _CarPreviewContainer({@required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Image.asset(bmw.photoUrl),
        fit: BoxFit.fill,
      ),
    );
  }
}

/*
FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          mini: true,
          child: Icon(
            Icons.car_rental,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
*/
