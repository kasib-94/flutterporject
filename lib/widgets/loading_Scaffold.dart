import 'package:flutter/material.dart';

@override
Widget buildLoadingScaffold(BuildContext context) {
  return const Scaffold(
    body: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircularProgressIndicator(
              semanticsLabel: 'Proszę czekać',
            ),
          ],
        ),
      ),
    ),
  );
}
