import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../app.dart';
import '../widgets/product_feature.dart';

class CarInfoScreen extends StatelessWidget {
  final Car car;
  CarInfoScreen({@required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: _CarPreviewContainer(car: bmw),
              ),
              Expanded(
                flex: 6,
                child: _CarInfo(car: bmw),
              ),
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
      backgroundColor: Color(0xFF151828),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 1, child: _CarInfoTitle(car: bmw)),
              Expanded(flex: 3, child: _CarInfoBody(car: bmw)),
              Expanded(flex: 1, child: _CarInfoBottom(car: bmw)),
            ],
          )
        ],
      ),
    );
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
      fontFamily: 'ArchivoNarrow',
      color: Colors.white,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: Row(
            children: [
              Text(
                'DESIGN',
                style: style,
              ),
              Text(
                'SPEC',
                style: style,
              ),
              Text(
                'HISTORY',
                style: style,
              ),
              Text(
                'HIRE',
                style: style,
              ),
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

class _CarInfoTitle extends StatelessWidget {
  final Car car;
  _CarInfoTitle({this.car});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 30,
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            car.title,
            style: TextStyle(
              fontFamily: 'AdventProM',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(
            'IS OUR NEXT INVENTION',
            style: TextStyle(
              fontFamily: 'AdventProL',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
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
      padding: EdgeInsets.only(
        left: 45,
        right: 45,
        top: 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF151828),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CarName(
            name: bmw.name,
            model: bmw.model,
          ),
          SizedBox(height: 40),
          _CarDescription(
            description: bmw.description,
          ),
        ],
      ),
    );
  }
}

class _CarInfoBottom extends StatelessWidget {
  final Car car;
  _CarInfoBottom({this.car});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: _CarSpecs(
            carSpecs: car.carSpecs,
          ),
        ),
        // Container(
        //   //padding: EdgeInsets.only(bottom: 30),
        //   alignment: Alignment.bottomCenter,
        //   decoration: BoxDecoration(
        //     color: Color(0xFF1b2139),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(50),
        //     ),
        //   ),
        //   child: _BottomIcons(),
        // )
      ],
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
  final List<Specs> carSpecs;
  _CarSpecs({this.carSpecs});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var feature in carSpecs)
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
        fontFamily: "ArchivoNarrow",
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    );
  }
}

class _CarName extends StatelessWidget {
  final String name;
  final String model;
  _CarName({this.name, this.model});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment(-1, 0),
                  image: AssetImage('assets/buttons/circleImage.jpg'),
                ),
                border: Border.all(
                  color: Colors.red,
                  width: 1,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'AdventProM',
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            Text(
              model,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: 'AdventProL',
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
