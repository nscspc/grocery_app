import 'package:firebase_database/firebase_database.dart';

class contact {
  late String _id;
  late String _firstName;
  late String _lastName;
  late String _phone;
  late String _email;
  late String _address;
  //late String _photoUrl;

// constructor for add :-
  contact(
      this._firstName, this._lastName, this._phone, this._email, this._address);
// constructor for editting the data :-
  contact.withId(this._id, this._firstName, this._lastName, this._phone,
      this._email, this._address);
// withId => means it is not going to generate the id(from firebase) so we have to pass the id.

// getters :-
  String get id => this._id;
  String get firstName => this._firstName;
  String get lastName => this._lastName;
  String get phone => this._phone;
  String get email => this._email;
  String get address => this._address;

// setters :-
  set firstName(String firstName) {
    this._firstName = firstName;
  }

  set lastName(String lastName) {
    this._lastName = lastName;
  }

  set phone(String phone) {
    this._phone = phone;
  }

  set email(String email) {
    this._email = email;
  }

  set address(String address) {
    this._address = address;
  }

  // set photoUrl(String photoUrl) {
  //   this._photoUrl = photoUrl;
  // }

// to get the data from firebase into the class :-
  contact.fromSnapshot(DataSnapshot snapshot) {
    // ignore: unnecessary_this
    this._id = snapshot.key.toString();
    // ignore: unnecessary_this

    // ignore: unnecessary_this
    this._firstName = snapshot.value["firstName"];
    this._lastName = snapshot.value['lastName'];
    this._phone = snapshot.value['phone'];
    this._email = snapshot.value['email'];
    this._address = snapshot.value['address'];
    // this._photoUrl = snapshot.value['photoUrl'];
  }

// to send the data from class to the firebase we convert into the json :-
  Map<String, dynamic> toJson() {
    return {
      "firstName": _firstName,
      "lastName": _lastName,
      "phone": _phone,
      "email": _email,
      "address": _address,
      // "photoUrl": _photoUrl,
    };
  }
}

// snapshot :- a word for representing the data that is packed into the json format and then send.