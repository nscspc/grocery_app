import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/user.dart';
import 'package:grocery/viewcontact.dart';
// import 'package:major_project/button_widget.dart';
// import 'package:major_project/textfield_widget.dart';
// import 'package:major_project/user.dart';
// import 'package:major_project/user_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    contact ContactObj =
        contact("name", "username", "phone", "email", "address");
    // DatabaseReference _databaseReference=
    _databaseReference.push().set(ContactObj.toJson());
  }

  @override
  Widget build(BuildContext context) {
    // final user = user_pr;
    contact user;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 5.7,
              left: MediaQuery.of(context).size.width / 4.0,
              child: Container(
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width / 2.1,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow[50],
                    image: DecorationImage(
                        image: AssetImage("assets/useravtar.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2.18,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.0,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: viewcontact(_databaseReference.key),
                  // child: Container(
                  //   child: FirebaseAnimatedList(
                  //       // Creates a scrolling container that animates items when they are inserted or removed.
                  //       query:
                  //           _databaseReference, // A Firebase query to use to populate the animated list . On basis of the query passed( which is the databasereference) the list is going to animate.
                  //       itemBuilder: (BuildContext context,
                  //           DataSnapshot snapshot,
                  //           Animation<double> animation,
                  //           int index) {
                  //         return viewcontact(snapshot.key.toString());
                  //       }
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     buildNameEmail(user),
                  //     SizedBox(
                  //       height: 30,
                  //     ),
                  //     buildCityMo(user),
                  //     SizedBox(
                  //       height: 50,
                  //     ),
                  //   ],
                  // ),
                  //       ),
                  // ),
                ),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// getContact(id) async {
//   DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
//   late String id="";
//   // _viewcontactState(this.id);
//   late contact _contact;
//   bool isLoading = true;
//     _databaseReference.child(id).onValue.listen((event) {
//       setState(() {
//         _contact = contact.fromSnapshot(event.snapshot);
//         isLoading = false;
//       });
//     });
//   }

// Widget buildNameEmail(contact user) {
//   return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//     Text(
//       user.,
//       style: GoogleFonts.rubik(
//           fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
//     ),
//     SizedBox(
//       height: 10,
//     ),
//     Text(user.email.toString(),
//         style: GoogleFonts.rubik(
//           fontSize: 20,
//           color: Colors.blue,
//         ))
//   ]);
// }

// Widget buildCityMo(User user) {
//   return Column(
//     children: [
//       Text(user.mobile,
//           style: GoogleFonts.rubik(
//             fontSize: 20,
//             color: Colors.blue,
//           )),
//       SizedBox(
//         height: 30,
//       ),
//       Text(user.city,
//           style: GoogleFonts.rubik(
//             fontSize: 20,
//             color: Colors.blue,
//           )),
//     ],
//   );
// }


// class EditProfile extends StatefulWidget {

//   @override
//   _EditProfileState createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {

//     DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
//   String _firstName = '';
//   String _lastName = '';
//   String _phone = '';
//   String _email = '';
//   String _address = '';
//   String _photoUrl = 'empty';
  
//    saveContact(BuildContext context) async {
//     if (_firstName.isNotEmpty &&
//         _lastName.isNotEmpty &&
//         _phone.isNotEmpty &&
//         _email.isNotEmpty &&
//         _address.isNotEmpty) {
//       contact ContactObj = contact(this._firstName, this._lastName, this._phone,
//           this._email, this._address);

//       await _databaseReference.push().set(ContactObj.toJson());
//       // push() :-
//       /*
//       => Generates a new child location using a unique key 
//          and returns a DatabaseReference to it. This is
//          useful when the children of a Firebase Database 
//          location represent a list of items.
//       => The unique key generated by childByAutoId: is 
//          prefixed with a client-generated timestamp so 
//          that the resulting list will be 
//          chronologically-sorted.
//       */

//       // set() :-
//       /*
//       => Write value to the location with the specified 
//         priority if applicable.
//       => This will overwrite any data at this location and
//          all child locations.
//       => Data types that are allowed are String, boolean, 
//           int, double, Map, List.
//       => The effect of the write will be visible immediately 
//           and the corresponding events will be triggered. Synchronization of the data to the Firebase Database servers will also be started.
//       => Passing null for the new value means all data at 
//           this location or any child location will be deleted.
//       */
//       navigateToLastScreen(context);
//     } else {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text("Field Required"),
//               content: Text("All fields are required"),
//               actions: [
//                 FlatButton(
//                   child: Text("Close"),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           });
//     }
//   }

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Contact'),
//       ),
//       body: Container(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: ListView(
//             // it also facilitates the scrolling as well.
//             children: [
//               // Container(
//               //   margin: EdgeInsets.only(top: 20.0),
//               //   child: GestureDetector(
//               //     onTap: () {
//               //       this.pickImage();
//               //     },
//               //     child: Center(
//               //       child: Container(
//               //         width: 100.0,
//               //         height: 100.0,
//               //         decoration: BoxDecoration(
//               //           shape: BoxShape.circle,
//               //           image: DecorationImage(
//               //             fit: BoxFit.cover,
//               //             // image: _photoUrl == "empty" ? const AssetImage("assets/logo.png") :Image.network(NetworkImage(_photoUrl)),
//               //             image: _photoUrl == "empty"
//               //                 ? AssetImage("assets/logo.png") as ImageProvider
//               //                 : NetworkImage(_photoUrl),
//               //           ),
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // FirstName :-
//               Container(
//                 margin: EdgeInsets.only(top: 20.0),
//                 child: TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       _firstName = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'First Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//               // LastName :-
//               Container(
//                 margin: EdgeInsets.only(top: 20.0),
//                 child: TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       _lastName = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Last Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//               // phone :-
//               Container(
//                 margin: EdgeInsets.only(top: 20.0),
//                 child: TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       _phone = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Phone',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//               // email :-
//               Container(
//                 margin: EdgeInsets.only(top: 20.0),
//                 child: TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       _email = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//               // address :-
//               Container(
//                 margin: EdgeInsets.only(top: 20.0),
//                 child: TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       _address = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Address',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 20.0),
//                 child: RaisedButton(
//                   padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
//                   onPressed: () {
//                     saveContact(context);
//                   },
//                   color: Colors.red,
//                   child: Text(
//                     "Save",
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



//   navigateToLastScreen(context) {
//     Navigator.of(context).pop();
//   }
