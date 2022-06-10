import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocery/ForgotPassword.dart';
import 'package:grocery/homepage.dart';
import 'package:grocery/register_page.dart';
import 'package:grocery/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String userkey2;
  getdata() async {
    final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
    final String? userkey = prefs.getString(email);
    userkey2 = userkey.toString();
    print(userkey2);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text(
          userkey2,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => homepage(userkey2)),
    );
  }

  var email = "";
  var password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final storage = new FlutterSecureStorage();

  // checkAuthentication() async {
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     // print(FirebaseAuth.instance.currentUser?.uid);
  //     getdata();
  //   }
  //   // _auth.onAuthStateChanged.listen((user) {
  //   //   if (user == null) {
  //   //     Navigator.pushReplacementNamed(context, "/SigninPage");
  //   //   }
  //   // });
  // }

  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      // print(FirebaseAuth.instance.currentUser?.uid);
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        for (final providerProfile in user.providerData) {
          // ID of the provider (google.com, apple.cpm, etc.)
          // final provider = providerProfile.providerId;

          // UID specific to the provider
          // final uid = providerProfile.uid;

          // Name, email address, and profile photo URL
          // final name = providerProfile.displayName;
          email = providerProfile.email!;
          print(email);
          getdata();
          // getdata();
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => homepage(userkey2)),
          // );
          // final profilePhoto = providerProfile.photoURL;
        }
      }
    }
  }
  //   email=FirebaseAuth.instance.
  //   getdata();
  // }
  // email=Fireba
  // }

  userLogin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await storage.write(key: "uid", value: userCredential.user?.uid);

      getdata();

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => homepage(userkey2)),
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                      ColorFilter.mode(Colors.black45, BlendMode.darken))),
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
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 95,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[600]!.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 21),
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.white),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  )),
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Email';
                                } else if (!value.contains('@')) {
                                  return 'Please Enter Valid Email';
                                }
                                return null;
                              },
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[600]!.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 21),
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.white),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPassword(), //////////s/////////////////////////////////////////////////////////////
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password ?",
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
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
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          email = emailController.text;
                                          password = passwordController.text;
                                        });
                                        userLogin();
                                      }
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, a, b) =>
                                        register_page(),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                  (route) => false);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.white))),
                                child: Text(
                                  "Create New Account",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
