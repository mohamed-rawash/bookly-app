import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_skelton.dart';

class CustomImageLoading extends StatelessWidget {
  const CustomImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade500,
      enabled: true,
      child: const Skelton(
        width: 130,
        height: 220,
      ),
    );
  }
}
