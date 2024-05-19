// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutterporject/utils/models/models.dart';
import 'package:flutterporject/widgets/dropdown_menu.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutterporject/utils/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers().then((fetchedUsers) {
      setState(() {
        users = fetchedUsers;
      });
    }).catchError((error) {
      print('Error fetching users: $error');
    });
  }

  Future<List<User>> fetchUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Row(
          children: [
            // CustomTextField(maxLines: 1, maxLength: 100, hintText: 'Wpisz nr 1-100', controller: titleController),
            DropdownMenuExample(elements: users)
            //  _actionButton(() => null, Icons.check)
          ],
        ),
      ),
    );
  }

  IconButton _actionButton(Function()? onPress, IconData icon) {
    return IconButton(
      onPressed: onPress,
      splashRadius: 20,
      splashColor: AppTheme.accent,
      icon: Icon(
        icon,
        color: AppTheme.medium,
      ),
    );
  }
}
