import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:notesshare/home.dart';
import 'package:notesshare/registration.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //colors used here
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;
  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER API URL
    var url = 'https://heavenly-race.000webhostapp.com/login.php';

    // Store all data with Param Name.
    var data = {'email': email, 'password': password};

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: new Text("OK"),
              onPressed: () {
                if (message.contains("Login Matched")) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Fhome()));
                } else {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Login()));
                }
              },
            ),
          ],
        );
      },
    );
  }

  // for the validation we must need the form
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32.0),
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: ListView(
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        'Login to the app and continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Enter your email and password below to continue to the Notes Sharing App and let the learning begin!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          border: Border.all(color: Colors.blue)),
                      child: TextFormField(
                        // ignore: missing_return
                        validator: (String name) {
                          if (!name.contains("@")) {
                            return "Please enter a valid email";
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white),
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            // prefix: Icon(icon),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        border: Border.all(color: Colors.blue),
                      ),
                      child: TextFormField(
                        // ignore: missing_return
                        validator: (String password) {
                          Pattern pattern =
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                          RegExp regex = new RegExp(pattern);
                          print(password);
                          if (password.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (!regex.hasMatch(password))
                              return 'Enter valid password';
                            else
                              return null;
                          }
                        },
                        obscureText: true,
                        controller: passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            // prefix: Icon(icon),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      elevation: 0,
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          userRegistration();
                        } else {
                          return "please enter the valid details";
                        }
                      },
                      color: logoGreen,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Wrap(
                        children: [
                          Text(
                            "Still don't have an account?",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => RegisterUser(),
                                ),
                              );
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: visible,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildFooterLogo(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildFooterLogo() {
    return Center(
      child: Wrap(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(
              'images/ankitf.jpg',
            ),
          ),
          Text(
            'Notes Sharing\n Developer: Ankit Kumar',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
