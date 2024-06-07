import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterporject/utils/models/models.dart';
import 'package:flutterporject/widgets/loading_Scaffold.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  final int selectedUserId;

  const UserScreen({Key? key, required this.selectedUserId}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    fetchUsers().then((fetchedUser) {
      setState(() {
        user = fetchedUser;
      });
    }).catchError((error) {
      print('Error fetching user: $error');
    });
  }

  Future<User> fetchUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users/${widget.selectedUserId}');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return User.fromJson(body);
    } else {
      throw Exception('Błąd!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return user != null ? buildUserScaffold(context) : buildLoadingScaffold(context);
  }

  Widget buildUserScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.person),
            Text('Witaj, ${user!.email}'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Welcome, ${user!.email}'),
      ),
    );
  }
}
