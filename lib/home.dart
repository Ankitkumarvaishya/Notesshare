import 'package:flutter/material.dart';
class Fhome extends StatefulWidget {
  @override
  _FhomeState createState() => _FhomeState();
}

class _FhomeState extends State<Fhome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notesshare"),
      ),
      drawer: Drawer(
        child: Container(
          //used to change the color of the container i.e. after the head drawer part
          // color: Color(0xff18203d),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage("images/splash-image.png"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome To The Notes Sharing App",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xff25bcbb),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('Profile'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.notes_sharp),
                title: Text('View Notes'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.upload_file),
                title: Text('Upload Notes'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('About Us'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: (){},
            child: Text("upload file"),
          ),
          
          MaterialButton(
            color: Colors.blue,
            onPressed: (){},
            child: Text("Save file"),
          ),
        ],
      ),
    );
  }
}
