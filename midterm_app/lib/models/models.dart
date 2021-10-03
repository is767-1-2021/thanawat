import 'package:flutter/material.dart';

class FirstFormModel extends ChangeNotifier {
  String? _name;
  String? _email;
  String? _username;
  String? _password;

  get name => this._name;

  set name(value) {
    this._name = value;
    notifyListeners();
  }

  get email => this._email;

  set email(value) {
    this._email = value;
    notifyListeners();
  }

  get username => this._username;

  set username(value) {
    this._username = value;
    notifyListeners();
  }

  get password => this._password;

  set password(value) {
    this._password = value;
    notifyListeners();
  }
}
