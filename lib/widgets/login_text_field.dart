import 'package:flutter/material.dart';
import '../utils/text_field_style.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasAsterisks;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.hasAsterisks = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(validator != null) {
          return validator!(value);
        }
        return null;
      },
      obscureText: hasAsterisks,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: ThemeTextFieldStyle.loginTextFieldStyle,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
