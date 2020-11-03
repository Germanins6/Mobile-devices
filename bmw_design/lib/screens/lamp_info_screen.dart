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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 5, child: _CarPreviewContainer(car: bmw)),
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
            child: Icon(Icons.drag_handle_rounded),
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
            // Expanded(flex: 1, child: _CarInfoTabs(car: bmw)),
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
    final TextStyle style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'PantonDemo-Light',
      color: Colors.white,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: Row(
            children: [
              Text('DESIGN', style: style),
              Text('SPEC', style: style),
              Text('HISTORY', style: style),
              Text('HIRE', style: style),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          height: 45,
          decoration: BoxDecoration(
            color: Color(0xFF1b2139),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
        ),
      ],
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
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: _BottomIcons(),
    );
  }
}

class _BottomIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Icon 1
        Icon(
          Icons.border_all_rounded,
          color: Colors.white,
        ),
        //Icon 2
        Icon(
          Icons.favorite_border_rounded,
          color: Colors.white,
        ),
        //MiddleButton
        FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(
            Icons.car_repair,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        //Icon 3
        Icon(
          Icons.search_rounded,
          color: Colors.white,
        ),
        //Icon 4
        Icon(
          Icons.account_circle_sharp,
          color: Colors.white,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
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

class _CarPreviewContainer extends StatelessWidget {
  final Car car;
  _CarPreviewContainer({@required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _CarPicture(car: bmw),
          _CarInfoTabs(),
        ],
      ),
    );
  }
}

class _CarPicture extends StatelessWidget {
  final Car car;
  _CarPicture({this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Image.asset(
        bmw.photoUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
