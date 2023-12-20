import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_skelton.dart';

class CustomImageLoading extends StatelessWidget {
  const CustomImageLoading({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade500,
      enabled: true,
      child:  Skelton(
        width: width?? 130,
        height: height?? 220,
      ),
    );
  }
}
