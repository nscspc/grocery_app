import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grocery/user.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class editcontact extends StatefulWidget {
  final String id;
  editcontact(this.id);
  @override
  State<editcontact> createState() => _editcontactState(id);
}

class _editcontactState extends State<editcontact> {
  String id;
  _editcontactState(this.id);

  String _firstName = '';
  String _lastName = '';
  String _phone = '';
  String _address = '';
  String _email = '';
  // late String _photoUrl;

  // handle text editting controller :-
  TextEditingController _fnController = TextEditingController();
  TextEditingController _lnController = TextEditingController();
  TextEditingController _poController = TextEditingController();
  TextEditingController _emController = TextEditingController();
  TextEditingController _adController = TextEditingController();

  bool isLoading = true;

  // db/firebase helper :-
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    // get contact from firebase :-
    this.getContact(id);
  }

  getContact(id) async {
    contact _contact;
    _databaseReference.child(id).onValue.listen((event) {
      _contact = contact.fromSnapshot(event.snapshot);

      _fnController.text = _contact.firstName;
      _lnController.text = _contact.lastName;
      _poController.text = _contact.phone;
      _emController.text = _contact.email;
      _adController.text = _contact.address;

      setState(() {
        _firstName = _contact.firstName;
        _lastName = _contact.lastName;
        _phone = _contact.phone;
        _email = _contact.email;
        _address = _contact.address;

        isLoading = false;
      });
    });
  }

  // update contact :-
  updateContact(BuildContext context) async {
    if (_firstName.isNotEmpty &&
        _lastName.isNotEmpty &&
        _phone.isNotEmpty &&
        _email.isNotEmpty &&
        _address.isNotEmpty) {
      contact _contact = contact.withId(this.id, this._firstName,
          this._lastName, this._phone, this._email, this._address);

      await _databaseReference.child(id).set(_contact.toJson());
      navigateToLastScreen(context);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Field Required"),
              content: Text("All fields are required"),
              actions: [
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  // pick image :-
  // Future pickImage() async {
  //   File file = await ImagePicker.pickImage(
  //       source: ImageSource.gallery, maxHeight: 200.0, maxWidth: 200.0);
  //   String filename = basename(file.path);
  //   uploadImage(file, filename);
  // }

  // //upload image :-
  // void uploadImage(File file, String filename) async {
  //   StorageReference _storageReference =
  //       FirebaseStorage.instance.ref().child(filename);
  //   //upload image
  //   _storageReference.putFile(file).onComplete.then((firebaseFile) async {
  //     var downloadUrl = await firebaseFile.ref.getDownloadURL();
  //     setState(() {
  //       _photoUrl = downloadUrl;
  //     });
  //   });
  // }

  navigateToLastScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    //image view
                    // Container(
                    //     margin: EdgeInsets.only(top: 20.0),
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         this.pickImage();
                    //       },
                    //       child: Center(
                    //         child: Container(
                    //             width: 100.0,
                    //             height: 100.0,
                    //             decoration: BoxDecoration(
                    //                 shape: BoxShape.circle,
                    //                 image: DecorationImage(
                    //                   fit: BoxFit.cover,
                    //                   image: _photoUrl == "empty"
                    //                       ? const AssetImage("images/logo.png")
                    //                           as ImageProvider
                    //                       : NetworkImage(_photoUrl),
                    //                 ))),
                    //       ),
                    //     )),
                    //
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _firstName = value;
                          });
                        },
                        controller: _fnController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    //
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _lastName = value;
                          });
                        },
                        controller: _lnController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    //
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _phone = value;
                          });
                        },
                        controller: _poController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    //
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        controller: _emController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    //
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _address = value;
                          });
                        },
                        controller: _adController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    // update button
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                        onPressed: () {
                          updateContact(context);
                        },
                        color: Colors.blue,
                        child: Text(
                          "Update",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
