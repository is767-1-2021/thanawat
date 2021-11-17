import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserData {
  String fullname;
  String birthdate;
  String email;
  String phone;
  String username;
  String password;
  String image;
  String uid;
  bool isLoggedIn;

  UserData(this.fullname, this.birthdate, this.email, this.phone, this.username,
      this.password, this.image, this.uid, this.isLoggedIn);

  factory UserData.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserData(
      json['fullname'] as String,
      json['birthdate'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['username'] as String,
      json['password'] as String,
      json['image'] as String,
      json['uid'] as String,
      json['isLoggedIn'] as bool,
    );
  }
}

class AllUsers {
  final List<UserData> users;
  AllUsers(this.users);

  factory AllUsers.fromJson(List<dynamic> json) {
    List<UserData> users;

    users = json.map((index) => UserData.fromJson(index)).toList();

    return AllUsers(users);
  }

  factory AllUsers.fromSnapshot(QuerySnapshot s) {
    List<UserData> users = s.docs.map((DocumentSnapshot ds) {
      return UserData.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllUsers(users);
  }
}

/*class UserModel extends ChangeNotifier {
  String? _fullname;
  String? _birthdate;
  String? _email;
  String? _phone;
  String? _username;
  String? _password;
  String? _image;
  String? _uid;
  bool _isLoggedIn = false;
  // List<UserDB> _userList = [];

  // UserDB? _selectedUser;

 Map<String, dynamic> toJson() => {
        'fullname': _fullname,
        'birthdate': _birthdate,
        'email': _email,
        'phone': _phone,
        'userId': _username,
        'password': _password,
        'image': _image,
        'uid': _uid,
        'isLoggedIn': _isLoggedIn
      };
}

class UserDB {
  var fullname;

  var birthdate;

  var email;

  var phone;

  var username;

  var password;

  var image;

  var uid;

  var isLoggedIn;


  UserDB(
      {this.fullname,
      this.birthdate,
      this.email,
      this.phone,
      this.username,
      this.password,
      this.image,
      this.uid,
      this.isLoggedIn});
}*/

