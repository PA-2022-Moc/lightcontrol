import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List> getUsers() async {
    // List<User>
    final http.Response response = await http.get(
      Uri.parse("http://127.0.0.1:8010/api/v1/association/associationId=1)"),
    );
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List users = [];

    //TODO: parse users !
    users.addAll(
        (jsonBody["data"] as List).map((user) => User.fromJson(user)).toList());

    return users;
  }
}

class User {
  final String id;
  final String nom;
  final String info;
  final String creation;

  User(this.id, this.nom, this.info, this.creation);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["id"],
      json["nom"],
      json["info"],
      json["creation"],
    );
  }
}
