import 'dart:convert';
import 'package:flutter_api_project/model/user_name.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserApi {
  //future will  will make some time to get the respond
static Future<List<User>> fetchUsers() async {

  const url = 'https://randomuser.me/api/?results=100';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);
  final results = json['results'] as List<dynamic>;
  final users = results.map((e) {
    final name = UserName(title: e['name']['title'], first: e['name']['first'], last: e['name']['last']);
    return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name);
  }).toList();
return users;
}
}