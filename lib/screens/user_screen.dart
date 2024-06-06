import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final int selectedUserId;

  const UserScreen({Key? key, required this.selectedUserId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
      ),
      body: Center(
        child: Text('Selected User ID: $selectedUserId'),
      ),
    );
  }
}
