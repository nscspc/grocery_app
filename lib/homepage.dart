import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grocery/profile_page.dart';
import 'package:grocery/user.dart';
import 'package:grocery/viewcontact.dart';
import 'FruitAll.dart';
import 'LoginPage.dart';
import 'MoreView.dart';
import 'SpicesAll.dart';
import 'SpicesView.dart';
import 'VegetableAll.dart';

import 'FruitView.dart';
import 'VegetableView.dart';

import 'register_page.dart';

class homepage extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // late FirebaseUser user;

  bool isSignedIn = false;

  // checkAuthentication() async {
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     // print(FirebaseAuth.instance.currentUser?.uid);
  //     Navigator.pushReplacementNamed("/SigninPage");
  //   }
  //   // _auth.onAuthStateChanged.listen((user) {
  //   //   if (user == null) {
  //   //     Navigator.pushReplacementNamed(context, "/SigninPage");
  //   //   }
  //   // });
  // }
  // int a, b;
  // homepage(a,b);
  String key1;
  homepage(this.key1);

  @override
  State<homepage> createState() => _homepageState(key1);
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String key1;
  _homepageState(this.key1);

  // String key =
  // String key = register_page().key as String;
  // late String key;

  // DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  // @override
  // void initState() async {
  //   super.initState();
  //   _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  //   contact ContactObj =
  //       contact("name", "username", "phone", "email", "address");
  //   // DatabaseReference _databaseReference=
  //   await _databaseReference.push().set(ContactObj.toJson());
  // }

  // void setdata() async {
  //   DatabaseReference _databaseReference =
  //       FirebaseDatabase.instance.reference();
  //   contact ContactObj =
  //       contact("name", "username", "phone", "email", "address");
  //   // DatabaseReference _databaseReference=
  //   // Future<DataSnapshot> k;
  //   key = await _databaseReference.push().key;
  //   await _databaseReference.child(key).set(ContactObj.toJson());
  //   // String key = _databaseReference.key;
  //   // print("sdkdfjlksdfj");
  //   // k = _databaseReference.get();
  //   // ScaffoldMessenger.of(context).showSnackBar(
  //   //   SnackBar(
  //   //     backgroundColor: Colors.orangeAccent,
  //   //     content: Text(
  //   //       key,
  //   //       style: TextStyle(fontSize: 18.0, color: Colors.black),
  //   //     ),
  //   //   ),
  //   // );
  //   //   DatabaseReference push() {
  //   // return DatabaseReference._(_databaseReference.push());
  // }
  // }

  @override
  void initState() {
    super.initState();
    //     DatabaseReference _databaseReference =
    //     FirebaseDatabase.instance.reference();
    // contact ContactObj =
    //     contact("name", "username", "phone", "email", "address");
    // // DatabaseReference _databaseReference=
    //  _databaseReference.push().set(ContactObj.toJson());
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
          child: Text(
            "GROCERIE",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0, top: 7, bottom: 7),
            child: GestureDetector(
              // InkWell
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewcontact(key1)));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 0.3))
                    ],
                    color: Colors.blue[300],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/man.png"),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 6.0,
                                  spreadRadius: 4.0,
                                  offset: Offset(0.0, 0.3))
                            ],
                            image: DecorationImage(
                                image: AssetImage("assets/usermenu.png"),
                                fit: BoxFit.contain),
                            shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            // ListView(
            //   children: [
            //     // DrawerHeader(
            //     //   child: Image(
            //     //     image: AssetImage("assets/usermenu.png"),
            //     //   ),
            //     // ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homepage(key1)));
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.circle, color: Colors.blue),
              title: Text(
                'Fruits',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FruitAll()));
              },
            ),
            ListTile(
              leading: Icon(Icons.circle_outlined, color: Colors.blue),
              title: Text(
                'Vegetables',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VegetableAll()));
              },
            ),
            ListTile(
              leading: Icon(Icons.circle_sharp, color: Colors.blue),
              title: Text(
                'Spices',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SpicesAll()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.blue),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () async => {
                await FirebaseAuth.instance.signOut(),
                //await storage.delete(key: "uid"),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false)
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.logout, color: Colors.blue),
            //   title: Text(
            //     'setdata',
            //     style: TextStyle(fontSize: 18, color: Colors.blue),
            //   ),
            //   onTap: () async => {
            //     //await FirebaseAuth.instance.signOut(),
            //     //await storage.delete(key: "uid"),
            //     // setdata()
            //   },
            // ),
            //   ],
            // ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 5)),
          Container(
            height: 170,
            //width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/groceryimg.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Grocery Items',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: TabBar(
              controller: _tabController,
              isScrollable:
                  true, // by this it occupies only the required space not the full width of the screen.
              indicatorColor: Colors.transparent,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey.withOpacity(1.0),
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              unselectedLabelStyle:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  child: Text('Fruits'),
                ),
                Tab(
                  child: Text('Vegetables'),
                ),
                Tab(
                  child: Text('Spices'),
                ),
                Tab(
                  child: Text('More'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 500,
              child: TabBarView(
                controller: _tabController,
                children: [
                  FruitView(),
                  VegetableView(),
                  SpicesView(),
                  MoreView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// isScrollable : true
/*
=> Whether this tab bar can be scrolled horizontally.
=> If [isScrollable] is true, then each tab is as wide as
   needed for its label and the entire [TabBar] is scrollable.
   Otherwise each tab gets an equal share of the available 
   space.
*/
