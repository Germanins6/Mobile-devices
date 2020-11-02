import 'package:flutter/material.dart';
import '../app.dart';
import '../widgets/color_sample.dart';
import '../widgets/product_feature.dart';

class LampInfoScreen extends StatelessWidget {
  final Lamp lamp;
  LampInfoScreen({@required this.lamp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 5, child: _LampPreview(lamp: lamp)),
              Expanded(flex: 5, child: _LampInfo(lamp: lamp)),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: BackButton(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _AddToCart(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _ShoppingCartButton(),
          )
        ],
      ),
    );
  }
}

class _ShoppingCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60.0 + 24,
      padding: EdgeInsets.fromLTRB(14, 14 + 24.0, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(Icons.shopping_cart),
          ),
          Align(
            alignment: Alignment(.8, -.8),
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 140,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
        ),
      ),
      child: Text(
        'Add to cart',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _LampInfo extends StatelessWidget {
  final Lamp lamp;
  _LampInfo({this.lamp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _LampName(name: lamp.name),
          SizedBox(height: 6),
          _LampDescription(descr: lamp.description),
          SizedBox(height: 16),
          _LampFeatures(features: lamp.features),
          Spacer(),
          _LampPrice(price: lamp.price),
        ],
      ),
    );
  }
}

class _LampPrice extends StatelessWidget {
  final double price;
  _LampPrice({this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$price',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'MontserratAlternates',
        fontSize: 20,
      ),
    );
  }
}

class _LampFeatures extends StatelessWidget {
  final List<Feature> features;
  _LampFeatures({this.features});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var feature in features)
          ProductFeature(
            iconName: feature.icon,
            units: feature.units,
            value: feature.value,
          ),
      ],
    );
  }
}

class _LampDescription extends StatelessWidget {
  final String descr;
  _LampDescription({this.descr});
  @override
  Widget build(BuildContext context) {
    return Text(
      descr,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }
}

class _LampName extends StatelessWidget {
  final String name;
  _LampName({this.name});

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

class _LampPreview extends StatelessWidget {
  final Lamp lamp;
  _LampPreview({@required this.lamp});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          _LampPhoto(asset: lamp.photoUrl),
          Spacer(),
          _LampColors(color: lamp.color),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _LampPhoto extends StatelessWidget {
  final String asset;
  _LampPhoto({this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080,
      child: Image.asset(asset),
    );
  }
}

class _LampColors extends StatelessWidget {
  final Color color;
  _LampColors({this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorSample(
          color: Colors.white,
          colorName: 'White',
          selected: color == Colors.white,
        ),
        SizedBox(width: 12),
        ColorSample(
          color: Colors.amber,
          colorName: 'Yellow',
          selected: color == Colors.amber,
        ),
        SizedBox(width: 12),
        ColorSample(
          color: Colors.orange,
          colorName: 'Orange',
          selected: color == Colors.orange,
        )
      ],
    );
  }
}
