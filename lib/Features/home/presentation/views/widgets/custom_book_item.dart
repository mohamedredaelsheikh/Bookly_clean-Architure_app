import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final String validImageUrl = (image.isEmpty)
        ? 'https://via.placeholder.com/150' // Default placeholder image
        : image;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            imageUrl: validImageUrl,
            fit: BoxFit.fill,
          )),
    );
  }
}
