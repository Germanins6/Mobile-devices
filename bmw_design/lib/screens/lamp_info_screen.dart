import 'package:flutter/material.dart';
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
              Expanded(flex: 5, child: _CarPreviewContainer(car: bmw)),
              Expanded(flex: 5, child: _CarInfo(car: bmw)),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: BackButton(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: _BackButton(),
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

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 60,
      height: 60.0 + 24,
      child: Stack(
        children: [
          Center(
            child: Icon(Icons.arrow_back),
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
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CarName(name: bmw.name),
          SizedBox(height: 6),
          _CarDescription(car_review: bmw.description),
          SizedBox(height: 16),
          _CarSpecs(car_specs: bmw.car_specs),
          //Spacer(),
        ],
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
            image: feature.image,
            units: feature.units,
            value: feature.value,
          ),
      ],
    );
  }
}

class _CarDescription extends StatelessWidget {
  final String car_review;
  _CarDescription({this.car_review});
  @override
  Widget build(BuildContext context) {
    return Text(
      car_review,
      style: TextStyle(
        color: Colors.grey,
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
          'lamp',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'MontserratAlternates',
          ),
        ),
        Spacer(),
        FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          mini: true,
          child: Icon(
            Icons.favorite,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
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
      child: Column(
        children: [
          _CarPicture(asset: bmw.photoUrl),
          Spacer(),
        ],
      ),
    );
  }
}

class _CarPicture extends StatelessWidget {
  final String asset;
  _CarPicture({this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080,
      child: Image.asset(asset),
    );
  }
}

/*
Needed later 
decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
        ),
      ),
*/
