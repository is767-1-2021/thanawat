import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_app/models/user_models.dart';
import 'package:team_app/services/user_service.dart';

class UserController {
  final UserServices service;
  List<UserData> users = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  UserController(this.service);

  Future<List<UserData>> fectUsers() async {
    onSyncController.add(true);
    users = await service.getUsers();
    onSyncController.add(false);
    return users;
  }
}
