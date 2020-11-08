import 'package:flutter/material.dart';

import '../coloScheme.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[

          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: pathPainter(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(50),
            margin: EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Welcome User To ', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),),
                Text('EyeAid', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),),
                Text('Your Mobile Eye\n Clinic', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

// ignore: camel_case_types
class pathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path1Color;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height+0.4);
    path.quadraticBezierTo(size.width+0.35, size.height+0.40, size.width+0.58, size.height+0.60);
    path.quadraticBezierTo(size.width+0.72, size.height+0.0, size.width+0.92, size.height+0.0);
    path.quadraticBezierTo(size.width+0.98, size.height+0.8, size.width, size.height+0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}
