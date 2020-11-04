import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../app.dart';
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
      fontSize: 10,
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
          _CarName(
            title: bmw.title,
          ),
          SizedBox(height: 150),
          _CarDescription(
            description: bmw.description,
          ),
          SizedBox(height: 20),
          _CarSpecs(
            car_specs: bmw.specs,
          ),
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
        height: 3,
        color: Colors.white,
        fontFamily: "PantonDemo-Light",
        fontWeight: FontWeight.normal,
        fontSize: 10,
        wordSpacing: 4,
        letterSpacing: 1,
      ),
    );
  }
}

class _CarName extends StatelessWidget {
  final String title;
  _CarName({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'AdventPro-Thin',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 18,
          height: 30,
        ),
        Spacer(),
        Text(
          'IS OUR NEXT INVENTION',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'AdventPro-Thin',
            fontWeight: FontWeight.normal,
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
