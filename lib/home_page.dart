
import 'package:dodo/pages/appointment.dart';
import 'package:dodo/pages/home.dart';
import 'package:dodo/pages/menu.dart';
import 'package:dodo/pages/setting.dart';
import 'package:dodo/pages/user.dart';
import 'package:flutter/material.dart';
//import 'package:rty/login_page.dart';
import 'package:dodo/pages/camera.dart';


class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  @override
  Widget build(BuildContext context) {
    // final profilepic = Hero(
    //     tag: 'hero',
    //     child: Padding(
    //       padding: EdgeInsets.all(16.0),
    //       child: CircleAvatar(
    //         radius: 72.0,
    //         backgroundColor: Colors.transparent,
    //         backgroundImage: AssetImage('assests/images/logo2.jpg'),
    //       ),
    //     ));

    // final welcome = Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Text(
    //     'qeqwerqrt',
    //     style: TextStyle(fontSize: 28.0, color: Colors.black),
    //   ),
    // );

    // final bio = Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Text(
    //     'wetoiyoiytyoitoyt v vihoioepoesryhgnbbvgiivtbvwaiuwrjew',
    //     textAlign: TextAlign.center,
    //     style: TextStyle(fontSize: 16.0, color: Colors.black),
    //   ),
    // );

    // final fav = Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Text(
    //     'uteutwiutwyutiyttytyuteyu',
    //     textAlign: TextAlign.center,
    //     style: TextStyle(fontSize: 16.0, color: Colors.black),
    //   ),
    // );

    // final logout = Padding(
    //   padding: EdgeInsets.symmetric(vertical: 16.0),
    //   child: RaisedButton(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(24),
    //     ),
    //     onPressed: () {
    //       Navigator.of(context).pushNamed(LoginPage.tag);
    //     },
    //     padding: EdgeInsets.all(12),
    //     color: Colors.green,
    //     child: Text(
    //       'Logout',
    //       style: TextStyle(color: Colors.white, fontSize: 17.0),
    //     ),
    //   ),
    // );

    // final data = Container(
    //   width: MediaQuery.of(context).size.width,
    //   padding: EdgeInsets.all(28.0),
    //   decoration: BoxDecoration(
    //       gradient: LinearGradient(colors: [
    //     Colors.yellow[200],
    //     Colors.yellow[200],
    //   ])),
    //   child: Column(
    //     children: <Widget>[
    //       profilepic,
    //       welcome,
    //       bio,
    //       fav,
    //       logout,
    //     ],
    //   ),
    // );

    return  MyBottomNavigationBar();
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Menu(),
    Appointment(),
    Cameras(),
    User(),

    Setting(),
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.down,
      children: [
        Expanded(
          child: Scaffold(
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.deepPurpleAccent,
                onTap: onTappedBar,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    // ignore: deprecated_member_use
                    icon: Icon(Icons.home), title: Text('home'),),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.format_list_bulleted),
                    // ignore: deprecated_member_use
                    title: Text('Menu'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_hospital),
                    // ignore: deprecated_member_use
                    title: Text('Appointment'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.camera),
                    // ignore: deprecated_member_use
                    title: Text('Scan'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.perm_identity),
                    // ignore: deprecated_member_use
                    title: Text('User'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    // ignore: deprecated_member_use
                    title: Text('Setting'),
                  ),
                ]),
          ),
        ),
      ],
    );
  }


}



