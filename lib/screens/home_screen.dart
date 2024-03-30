// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterporject/utils/app_style.dart';
import 'package:flutterporject/widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _mainButton(() => null, "Nowy plik"),
                Row(
                  children: [
                    _actionButton(() => null, Icons.file_upload),
                    _actionButton(() => null, Icons.folder),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            CustomTextField(maxLines: 3, maxLength: 100, hintText: 'Enter video Title', controller: titleController),
            SizedBox(height: 40),
            CustomTextField(
                maxLines: 5, maxLength: 5000, hintText: 'Enter video description', controller: titleController),
            CustomTextField(maxLines: 3, maxLength: 100, hintText: 'Enter video Title', controller: titleController),
          ],
        ),
      ),
    );
  }

  ElevatedButton _mainButton(Function()? onPress, String text) {
    return ElevatedButton(
      onPressed: onPress,
      style: _buttonStyle(),
      child: Text(text),
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

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
        backgroundColor: AppTheme.accent,
        foregroundColor: AppTheme.dark,
        disabledBackgroundColor: AppTheme.disabledBackgroundColor,
        disabledForegroundColor: AppTheme.disabledForegroundColor);
  }
}
