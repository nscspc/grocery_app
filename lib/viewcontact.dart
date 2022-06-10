import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:grocery/user.dart';
import 'editcontact.dart';
// import '../model/contact.dart';
import 'package:url_launcher/url_launcher.dart';

class viewcontact extends StatefulWidget {
  final String id;
  viewcontact(this.id);
  @override
  State<viewcontact> createState() => _viewcontactState(id);
}

class _viewcontactState extends State<viewcontact> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  late String id;
  _viewcontactState(this.id);
  late contact _contact;
  bool isLoading = true;

  getContact(id) async {
    _databaseReference.child(id).onValue.listen((event) {
      setState(() {
        _contact = contact.fromSnapshot(event.snapshot);
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.getContact(id);
  }

  // callAction(String number) async {
  //   String url = 'tel://$number';
  //   //if (await canLaunch(url)) {
  //   await launch((url));
  //   //} else {
  //   //throw 'could not call $number';
  //   //}
  // }

  // smsAction(String number) async {
  //   String url = 'sms://$number';
  //   //if (await canLaunch(url)) {
  //   await launch(url);
  //   //} else {
  //   // throw 'could not send sms to $number';
  //   //}
  // }

  // deleteContact() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Delete ?"),
  //           content: Text("Delete Contact ?"),
  //           actions: [
  //             FlatButton(
  //               child: Text("Cancel"),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             FlatButton(
  //               child: Text("Delete"),
  //               onPressed: () async {
  //                 Navigator.of(context).pop();
  //                 await _databaseReference.child(id).remove();
  //                 navigateToLastScreen();
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  // remove() :-
  /*
  => Remove the data at this Firebase Database location. 
      Any data at child locations will also be deleted.
  => The effect of the delete will be visible immediately
     and the corresponding events will be triggered. Synchronization of the delete to the Firebase Database servers will also be started.
  => remove() is equivalent to calling set(null)
  */

  // navigateToEditScreen(id) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     // add id
  //     return editcontact(id);
  //   }));
  // }

  navigateToLastScreen() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // wrap screen in WillPopScreen widget
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  // header text container
                  // Container(
                  //     height: 200.0,
                  //     //child: Image(
                  //     //
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //         fit: BoxFit.contain,
                  //         // image: _photoUrl == "empty" ? const AssetImage("assets/logo.png") :Image.network(NetworkImage(_photoUrl)),
                  //         image: _contact.photoUrl == "empty"
                  //             ? const AssetImage("assets/logo.png")
                  //                 as ImageProvider
                  //             : NetworkImage(_contact.photoUrl),
                  //       ),
                  //       // image: _contact.photoUrl == "empty"
                  //       //     ? AssetImage("images/placeholder.png")
                  //       //     : NetworkImage(_contact.photoUrl),
                  //       // fit: BoxFit.contain,
                  //     )),
                  //name
                  // Stack(
                  // children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.height / 1.9,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue[400],
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: 0,
                  //   child:
                  // Container(
                  //   height: MediaQuery.of(context).size.height / 4,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(30),
                  //           topRight: Radius.circular(30))),
                  // ),
                  // ),
                  // Positioned(
                  //   top: MediaQuery.of(context).size.height / 19,
                  //   left: MediaQuery.of(context).size.width / 4.0,
                  // child:
                  SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width / 2.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow[50],
                        image: DecorationImage(
                            image: AssetImage("assets/man.png"),
                            fit: BoxFit.fitHeight)),
                  ),
                  SizedBox(height: 10),
                  // ),
                  // ]),
                  // Positioned(
                  //   top: MediaQuery.of(context).size.height / 3,
                  // child:
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.perm_identity),
                            Container(
                              width: 10.0,
                            ),
                            Text(
                              "${_contact.firstName} ${_contact.lastName}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        )),
                  ),
                  // ),
                  // ]),
                  // phone
                  // Positioned(
                  //   top: MediaQuery.of(context).size.height / 2.5,
                  // child:
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.phone),
                            Container(
                              width: 10.0,
                            ),
                            Text(
                              _contact.phone,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        )),
                  ),
                  // ),
                  // ]),
                  // email
                  // Positioned(
                  //   top: MediaQuery.of(context).size.height / 2.15,
                  //   child:
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.email),
                            Container(
                              width: 10.0,
                            ),
                            Text(
                              _contact.email,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        )),
                  ),
                  // ),
                  // address
                  // Positioned(
                  //   top: MediaQuery.of(context).size.height / 2.1,
                  //   child:
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.home),
                            Container(
                              width: 10.0,
                            ),
                            Text(
                              _contact.address,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        )),
                  ),
                  // ),
                  // ]),
                  // Positioned(
                  //   top: MediaQuery.of(context).size.height / 1.9,
                  //   child:
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.red)))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => editcontact(id)));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Icon(Icons.edit),
                                ),
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ))),
                  ),
                  // ),
                ],
              ),
        // call and sms
        // Card(
        //   elevation: 2.0,
        //   child: Container(
        //       margin: EdgeInsets.all(20.0),
        //       width: double.maxFinite,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: <Widget>[
        //           IconButton(
        //             iconSize: 30.0,
        //             icon: Icon(Icons.phone),
        //             color: Colors.red,
        //             onPressed: () {
        //               callAction(_contact.phone);
        //             },
        //           ),
        //           IconButton(
        //             iconSize: 30.0,
        //             icon: Icon(Icons.message),
        //             color: Colors.red,
        //             onPressed: () {
        //               smsAction(_contact.phone);
        //             },
        //           )
        //         ],
        //       )),
        // ),
        // edit and delete
        // Card(
        //   elevation: 2.0,
        //   child: Container(
        //       margin: EdgeInsets.all(20.0),
        //       width: double.maxFinite,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: <Widget>[
        //           IconButton(
        //             iconSize: 30.0,
        //             icon: Icon(Icons.edit),
        //             color: Colors.red,
        //             onPressed: () {
        //               navigateToEditScreen(id);
        //             },
        //           ),
        //           IconButton(
        //             iconSize: 30.0,
        //             icon: Icon(Icons.delete),
        //             color: Colors.red,
        //             onPressed: () {
        //               deleteContact();
        //             },
        //           )
        //         ],
        //       )),
        // )
        // ],
        // ),
      ),
    );
  }
}
