import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ShowSnackBar(String content, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.yellow,
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
