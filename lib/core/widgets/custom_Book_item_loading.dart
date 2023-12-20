import 'package:bookly/core/widgets/custom_skelton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookItemLoading extends StatelessWidget {
  const CustomBookItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade700,
      enabled: true,
      child: const SizedBox(
        height: 150,
        child: Row(
          children: [
            Skelton(
              width: 100,
              height: 150,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Skelton(
                  width: 180,
                  height: 20,
                ),
                SizedBox(
                  height: 8,
                ),
                Skelton(
                  height: 20,
                  width: 250,
                ),
                SizedBox(
                  height: 8,
                ),
                Skelton(
                  height: 20,
                  width: 250,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skelton(
                      width: 120,
                      height: 20,
                    ),
                    SizedBox(width: 6,),
                    Skelton(
                      width: 120,
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
