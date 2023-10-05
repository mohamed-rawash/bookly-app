import 'package:bookly/features/home/presentation/views/component/cariusel_item.dart';
import 'package:flutter/material.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => const CarouselItem(),
        separatorBuilder: (context, index) => const SizedBox(width: 14,),
      ),
    );
  }
}
