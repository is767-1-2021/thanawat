import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String fullname;
  final String birthdate;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String image;
  final String uid;
  bool isLoggedIn;

  Todo(this.fullname, this.birthdate, this.email, this.phone, this.username,
      this.password, this.image, this.uid, this.isLoggedIn);

  factory Todo.fromJson(
    Map<String, dynamic> json,
  ) {
    return Todo(
      json['fullname'] as String,
      json['birthdate'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['username'] as String,
      json['password'] as String,
      json['image'] as String,
      json['uid'] as String,
      json['completed'] as bool,
    );
  }
}

class AllTodos {
  final List<Todo> todos;
  AllTodos(this.todos);

  factory AllTodos.fromJson(List<dynamic> json) {
    List<Todo> todos;

    todos = json.map((index) => Todo.fromJson(index)).toList();

    return AllTodos(todos);
  }

  factory AllTodos.fromSnapshot(QuerySnapshot s) {
    List<Todo> todos = s.docs.map((DocumentSnapshot ds) {
      return Todo.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllTodos(todos);
  }
}
