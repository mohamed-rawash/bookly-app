import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AssetsPaths.carouselImage,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "This Is Plain Text For Texting Title In This Item",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20,
                ),
                SizedBox(height: 3),
                Text(
                  "This Is Plain",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14,
                ),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r"19.6$",
                      style: Styles.textStyle20,
                    ),
                    BookRating(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FaIcon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
        ),
        SizedBox(width: 6.3),
        Text("4.3", style: Styles.textStyle18,),
        SizedBox(width: 6.3),
        Text("(2222)", style: Styles.textStyle14,),
      ],
    );
  }
}
