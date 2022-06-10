// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:major_project/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/LoginPage.dart';
import 'package:grocery/homepage.dart';
import 'package:grocery/user.dart';
import 'package:grocery/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class register_page extends StatefulWidget {
  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  late String key;
  void setdata() async {
    DatabaseReference _databaseReference =
        FirebaseDatabase.instance.reference();
    contact ContactObj = contact("name", "username", "phone", email, "address");
    // DatabaseReference _databaseReference=
    // Future<DataSnapshot> k;
    key = _databaseReference.push().key;
    gkey = key;
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

// set value

    // _databaseReference.child(email).set(email);
    // await _databaseReference.push().set(email);
    await _databaseReference.child(key).set(ContactObj.toJson());
    prefs.setString(email, key);

    // String key = _databaseReference.key;
    // print("sdkdfjlksdfj");
    // k = _databaseReference.get();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text(
          key,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
    );
    //   DatabaseReference push() {
    // return DatabaseReference._(_databaseReference.push());
  }

  final _formKey = GlobalKey<FormState>();

  var email = "@";
  var password = "";
  var confirmPassword = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   Firebase.initializeApp();
  // }

  @override
  void dispose() {
    // clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  registration() async {
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        setdata();
        print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully. Please Login..",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => homepage(key),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password provided is too weak");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password provided is too weak",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          print("Account already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          );
        } else {
          print("Password and Confirm Password doesn't match");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password and Confirm Password doesn't match",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/groceryimage.png"),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken)),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 55,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "sign up by valid email",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 85),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      decoration: BoxDecoration(
                        color: Colors.grey[600]!.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 21),
                          border: InputBorder.none,
                          hintText: "Email",
                          errorStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[600]!.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: TextFormField(
                        obscureText: true,
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 21),
                            border: InputBorder.none,
                            errorStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                            hintText: "Create Password",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 28,
                              ),
                            )),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[600]!.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 21),
                            border: InputBorder.none,
                            errorStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Icon(
                                Icons.verified,
                                color: Colors.white,
                                size: 28,
                              ),
                            )),
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                LoginPage(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Text(
                        "Account exists Login ?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  email = emailController.text;
                                  password = passwordController.text;
                                  confirmPassword =
                                      confirmPasswordController.text;
                                });
                                registration();
                              }
                            },
                            child: Text(
                              "Create Account",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
