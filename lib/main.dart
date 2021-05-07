import 'package:flutter/material.dart';
import 'package:notesshare/home.dart';
import 'package:notesshare/registration.dart';

void main() {
  runApp(Notesshare());
  
}
class Notesshare extends StatefulWidget {
  @override
  _NotesshareState createState() => _NotesshareState();
}

class _NotesshareState extends State<Notesshare> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notesshare",
      home: Home(),
      
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //We take the image from the assets
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage('images/splash-image.png'),
                ),

                SizedBox(
                  height: 20,
                ),
                //Texts and Styling of them
                Text(
                  'Welcome to Notes Sharing App!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 20),
                Text(
                  'An Application Designed For Sharing Notes',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                //Our MaterialButton which when pressed will take us to a new screen named as
                //LoginScreen
                MaterialButton(
                  elevation: 5,
                  height: 50,
                  onPressed: () {
                    Navigator.push(context,
                    //RegisterUser should be here
                        MaterialPageRoute(builder: (_) => RegisterUser()));
                  },
                  color: logoGreen,
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
