import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hint;
  String? Function(String?)? validator;
  TextEditingController? controller;
  CustomTextField({
    Key? key,
    this.validator,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
