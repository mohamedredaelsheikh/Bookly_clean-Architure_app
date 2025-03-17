import 'package:flutter/material.dart';

class CustomImageLoadingIndecator extends StatelessWidget {
  const CustomImageLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
        ));
  }
}
