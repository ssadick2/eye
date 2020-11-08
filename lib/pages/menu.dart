import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Menu'),
      ),
      body: Center(
        child: Text('This is My Menu',style: TextStyle(color: Colors.yellow),
    ),
      ));
  }
}
