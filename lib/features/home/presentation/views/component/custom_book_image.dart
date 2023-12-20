import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_image_loading.dart';


class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key,  required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1.2/2,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          placeholder: (context, url) => const CustomImageLoading(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
