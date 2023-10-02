import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2/2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage(AssetsPaths.carouselImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            Positioned(
              right: 5,
              bottom: 5,
              child: InkWell(
                splashColor: Colors.white,
                child: ClipRect(
                  clipBehavior: Clip.antiAlias,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade200.withOpacity(0.2),
                      ),
                      child: const Center(child: Icon(Icons.play_arrow)),
                    ),
                  ),
                ),
                onTap: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
