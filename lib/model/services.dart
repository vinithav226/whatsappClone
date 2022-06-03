import 'dart:convert';

import 'package:http/http.dart';
import 'package:whatsapp/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRepo {
  Future<List<User>> getUserList();
}

class UserServices implements UserRepo {
  @override
  getUserList() async {
    List<User> users = [];
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    Response response = await http.get(url);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (final i in data) {
        users.add(User(
          date: DateTime.now(),
          id: i['username'],
          name: i['name'],
        ));
      }
    } else {}
    return users;
  }
}
