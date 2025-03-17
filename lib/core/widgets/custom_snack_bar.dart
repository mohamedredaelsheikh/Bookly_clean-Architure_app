import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(),
      ),
      duration: const Duration(seconds: 3),
    );
  }
}
