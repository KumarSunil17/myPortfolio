import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
              child:
                  Transform(transform: Matrix4.skewY(0.0)..rotateZ(3.14 / 25.0)..scale(1.4),child: Image.asset('assets/images/dp.png')))
        ],
      ),
    );
  }
}
