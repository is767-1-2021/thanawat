import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_app/models/user_models.dart';

abstract class Services {
  Future<List<UserData>> getUsers();
  Future<String> addUser(UserData value);
}

class UserServices extends Services {
  @override
  Future<List<UserData>> getUsers() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('million_user_profile')
        .get();

    AllUsers users = AllUsers.fromSnapshot(snapshot);
    return users.users;
  }

  Future<String> addUser(UserData value) async {
    DocumentReference ref = await FirebaseFirestore.instance
        .collection('million_user_profile')
        .add({
      'email': value.email,
      'birthdate': value.birthdate,
      'image': value.image,
      'password': value.password,
      'username': value.username,
      'fullname': value.fullname,
      'isLoggedIn': value.isLoggedIn,
      'phone': value.phone,
      'uid': value.uid,
    });

    return ref.id;
  }
}
