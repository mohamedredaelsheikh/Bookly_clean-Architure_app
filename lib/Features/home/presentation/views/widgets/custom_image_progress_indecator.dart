import 'package:flutter/material.dart';

class CustomImageProgressIndecator extends StatelessWidget {
  const CustomImageProgressIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          color: Colors.grey,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
        ));
  }
}
