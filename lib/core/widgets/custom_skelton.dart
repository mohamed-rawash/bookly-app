import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}