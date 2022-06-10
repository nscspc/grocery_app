// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/homepage.dart';
import 'package:grocery/register_page.dart';
import 'LoginPage.dart';
import 'homepage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // // await Firebase.initializeApp();
  // //  FirebaseMessaging.instance.subscribeToTopic("all");
  // //use of Firebase service without initialization of Firebase core.
  // await Firebase.initializeApp();
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyC4WM2-icRmES2JnnvfOmrUdpzUNdo9AW8",
      appId: "1:20063984025:android:9abba62c79b8aece4cdb08",
      messagingSenderId: "",
      projectId: "grocery-3c825",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // static final String title = 'User Profile';
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // final storage = new FlutterSecureStorage();

  // Future<bool> checkLoginStatus() async {
  //   String? value = await storage.read(key: "uid");
  //   if (value == null) {
  //     return true;
  //   }
  //   return true;
  // }

  // static final String title = 'User Profile';
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // final storage = new FlutterSecureStorage();

  // Future<bool> checkLoginStatus() async {
  //   String? value = await storage.read(key: "uid");
  //   if (value == null) {
  //     return true;
  //   }
  //   return true;
  // }

  // checkAuthentication(BuildContext context) async {
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     // print(FirebaseAuth.instance.currentUser?.uid);
  //     Navigator.pushReplacementNamed(context,"/SigninPage");
  //   }
  //   // _auth.onAuthStateChanged.listen((user) {
  //   //   if (user == null) {
  //   //     Navigator.pushReplacementNamed(context, "/SigninPage");
  //   //   }
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: _initialization,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         print("Something Went Wrong");
    //       }
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //             child: CircularProgressIndicator(
    //           color: Colors.white,
    //         ));
    //       }

//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Grocery',
//             theme: ThemeData(
//                 textTheme: GoogleFonts.josefinSansTextTheme(
//                     Theme.of(context).textTheme),
//                 // primarySwatch: Colors.blue,
//                 primaryColor: Colors.white),
//             home: FutureBuilder(
//                 future: checkLoginStatus(),
//                 builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//                   if (snapshot.data == false) {
//                     return LoginPage();
//                   }
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Container(
//                         color: Colors.white,
//                         child: Center(child: CircularProgressIndicator()));
//                   }
//                   return register_page();
//                 }),
//           );
//         });
//   }
// }

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   //await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: _initialization,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             print("Something Went Wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//                 child: CircularProgressIndicator(
//               color: Colors.white,
//             ));
//           }
    // getdata();
    // final prefs = await SharedPreferences.getInstance();
    // final String? userkey = prefs.getString(email);
    // userkey2 = userkey.toString();
    return MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      // routes: <String, WidgetBuilder>{
      //   "/SigninPage": (BuildContext context) => LoginPage(),
    );
  }
}

// homepage("-N2GTKC5hSNVXZhX8DfH")
