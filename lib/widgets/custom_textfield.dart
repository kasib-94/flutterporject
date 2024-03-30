import 'package:flutter/material.dart';
import 'package:flutterporject/utils/app_style.dart';

class CustomTextField extends StatefulWidget {
  final int maxLength;
  final int? maxLines;
  final String hintText;
  final TextEditingController controller;
  const CustomTextField(
      {super.key, required this.maxLength, this.maxLines, required this.hintText, required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _focusNode = FocusNode();

  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      onEditingComplete: () => FocusScope.of(context),
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      keyboardType: TextInputType.multiline,
      cursorColor: AppTheme.accent,
      style: AppTheme.inputStyle,
      decoration: InputDecoration(
        suffixIcon: _copyButton(context),
        hintStyle: AppTheme.hintStyle,
        hintText: widget.hintText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.accent),
        ),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.medium)),
        counterStyle: AppTheme.counterStyle,
      ),
    );
  }

  IconButton _copyButton(BuildContext context) {
    return IconButton(
        onPressed: widget.controller.text.isNotEmpty ? () => {} : null,
        color: AppTheme.accent,
        splashRadius: 20,
        splashColor: AppTheme.accent,
        icon: const Icon(Icons.content_copy_rounded));
  }
}
