import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

class Signup extends StatefulWidget {
  static String tag = 'signup-page';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50.0,
          child: Image.asset(
            'assests/images/logo1.jpg',
          ),
        ));

    final firstname = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.person_outline),
        hintText: 'Firstname',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final lastname = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.person_outline),
        hintText: 'Lastname',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final gender = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.gesture),
        hintText: 'Gender',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final age = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.person_pin),
        hintText: 'Age',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final location = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.location_on),
        hintText: 'location',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final confirmpassword = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.border_color),
        hintText: 'ConfirmPassword',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );


    final signupButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.green,
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text('Already have an ACCOUNT ? Click Here',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 15,
          )),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new LoginPage();
        }));
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 50.0),
            firstname,
            SizedBox(height: 15.0),
            lastname,
            SizedBox(height: 15.0),
            gender,
            SizedBox(height: 15.0),
            age,
            SizedBox(height: 15.0),
            location,
            SizedBox(height: 15.0),
            email,
            SizedBox(height: 15.0),
            password,
            SizedBox(height: 15.0),
            confirmpassword,
            SizedBox(height: 24.0),
            signupButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
