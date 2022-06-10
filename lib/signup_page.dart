// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class signuppage extends StatefulWidget {
//   @override
//   State<signuppage> createState() => _signuppageState();
// }

// class _signuppageState extends State<signuppage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   late String _name, _email, _password;

//   checkAuthentication() async {
//     _auth.onAuthStateChanged.listen((user) {
//       if (user.displayName != "") {
//         Navigator.pushReplacementNamed(context, "/");
//       }
//     });
//   }

//   navigateToSigninScreen() {
//     Navigator.pushReplacementNamed(context, "/SigninPage");
//   }

//   @override
//   void initState() {
//     super.initState();
//     this.checkAuthentication();
//   }

//   signup() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       try {
//         AuthResult user = await _auth.createUserWithEmailAndPassword(
//             email: _email, password: _password);

//         // to save _name in user we have to update the info :-
//         if (user != null) {
//           UserUpdateInfo updateuser = UserUpdateInfo();

//           updateuser.displayName = _name;
//           FirebaseUser userprofile = await FirebaseAuth.instance.currentUser();
//           userprofile.updateProfile(updateuser);
//           await userprofile.reload();
//           userprofile = await _auth.currentUser();
//           //await userprofile.reload();
//         }
//       } catch (e) {
//         showError(e.toString());
//       }
//     }
//   }

//   showError(String errorMessage) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Error"),
//             content: Text(errorMessage),
//             actions: [
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context)
//                       .pop(); //it pops the active region , and in this case the active region is the dialog box.
//                 },
//               ),
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign up'),
//       ),
//       body: Container(
//         child: Center(
//           child: ListView(
//             children: [
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
//                 child: Image(
//                   image: AssetImage("assets/logo.png"),
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.all(16),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(top: 20.0),
//                           child: TextFormField(
//                             validator: (input) {
//                               if (input!.isEmpty) {
//                                 return 'Provide a name';
//                               }
//                             },
//                             decoration: InputDecoration(
//                               labelText: 'Name',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                               ),
//                             ),
//                             onSaved: (input) => _name = input!,
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(top: 20.0),
//                           child: TextFormField(
//                             validator: (input) {
//                               if (input!.isEmpty) {
//                                 return 'Provide an email';
//                               }
//                             },
//                             onChanged: (input) {
//                               setState(() {
//                                 _name = input;
//                               });
//                             },
//                             decoration: InputDecoration(
//                               labelText: 'Email',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                               ),
//                             ),
//                             onSaved: (input) => _email = input!,
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(top: 20.0),
//                           child: TextFormField(
//                             validator: (input) {
//                               if (input!.length < 6) {
//                                 return 'Password should be 6 character atleast';
//                               }
//                             },
//                             decoration: InputDecoration(
//                               labelText: 'Password',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                               ),
//                             ),
//                             onSaved: (input) => _password = input!,
//                             obscureText: true,
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
//                           child: RaisedButton(
//                             padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
//                             color: Colors.blue,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(5)),
//                             onPressed: signup,
//                             child: Text(
//                               'Sign up',
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 20.0),
//                             ),
//                           ),
//                         ),

//                         //redirect to signup page :-
//                         GestureDetector(
//                           onTap: navigateToSigninScreen,
//                           child: Text(
//                             'Already have an Account ? ',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
