import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterporject/utils/models/models.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  final int selectedUserId;

  const UserScreen({Key? key, required this.selectedUserId}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    fetchUsers().then((fetchedUsers) {
      setState(() {
        user = fetchedUsers;
      });
    }).catchError((error) {
      print('Error fetching users: $error');
    });
  }

  Future<User> fetchUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users/${widget.selectedUserId}');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((e) => User.fromJson(e)).first;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email ?? ''),
      ),
    );
  }
}
