import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/product_feature.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'buyCar.dart';
import 'Profile.dart';
import 'package:bmw_design/widgets/car.dart';

class CarInfoScreen extends StatefulWidget {
  final Car car;

  CarInfoScreen({@required this.car});

  @override
  _CarInfoScreenState createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  final user = FirebaseAuth.instance.currentUser;

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
                child: _CarPreviewContainer(car: widget.car),
              ),
              Expanded(
                flex: 6,
                child: _CarInfo(car: widget.car),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: IconButton(
                  icon: Icon(Icons.favorite_outline_sharp),
                  onPressed: () {},
                )),
          ),
        ],
      ),
    );
  }
}

class _CarInfo extends StatefulWidget {
  final Car car;
  _CarInfo({this.car});

  @override
  __CarInfoState createState() => __CarInfoState();
}

class __CarInfoState extends State<_CarInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151828),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 3, child: _CarInfoBody(car: widget.car)),
              _CarInfoBottom(car: widget.car),
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
      fontFamily: 'Archivo',
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
    );
  }
}

class _CarInfoBody extends StatefulWidget {
  final Car car;
  _CarInfoBody({this.car});

  @override
  __CarInfoBodyState createState() => __CarInfoBodyState();
}

class __CarInfoBodyState extends State<_CarInfoBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF151828),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CarInfoTitle(car: widget.car),
            SizedBox(height: 20),
            _CarName(
              name: '${widget.car.brand}',
              model: '${widget.car.model}',
            ),
            SizedBox(height: 20),
            _CarDescription(description: '${widget.car.description}'),
            SizedBox(height: 20),
            _CarSpecs(carSpecs: widget.car.carSpecs)
          ],
        ),
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
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF1b2139),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Center(
              child: _BottomIcons(car),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ],
    );
  }
}

class _BottomIcons extends StatelessWidget {
  final Car car;
  _BottomIcons(this.car);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //BackButton
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //MiddleButton
        FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(
            Icons.add_shopping_cart_rounded,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuyCar(car)),
            );
          },
        ),
        //ProfileButton
        IconButton(
          icon: Icon(Icons.account_circle),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            velocity: feature.velocity,
            power: feature.power,
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
        fontFamily: "Archivo",
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
                  image: AssetImage('assets/tempLogo.png'),
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

class _CarPreviewContainer extends StatefulWidget {
  final Car car;
  _CarPreviewContainer({@required this.car});

  @override
  __CarPreviewContainerState createState() => __CarPreviewContainerState();
}

class __CarPreviewContainerState extends State<_CarPreviewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _CarPicture(car: widget.car),
          _CarInfoTabs(),
        ],
      ),
    );
  }
}

class _CarPicture extends StatefulWidget {
  final Car car;
  _CarPicture({this.car});

  @override
  __CarPictureState createState() => __CarPictureState();
}

class __CarPictureState extends State<_CarPicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Image.network(
        widget.car.photoUrl,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
