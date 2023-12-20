import 'package:bookly/config/app_router.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentation/views/component/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.bookDetailsViewPath),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? ""),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.volumeInfo?.title ?? "UnKnown",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20,
                  ),
                  const SizedBox(height: 3),
                  Wrap(
                    children: [
                      ...book.volumeInfo!.authors!.map(
                        (e) => Text(
                          "$e,   ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle14,
                        ),
                      ).take(2),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"Free",
                        style: Styles.textStyle20,
                      ),
                      BookRating(rating: "0", count: 0,),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.count});

  final String rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FaIcon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
        ),
        const SizedBox(width: 6.3),
        Text(
          rating,
          style: Styles.textStyle18,
        ),
        const SizedBox(width: 6.3),
        Text(
          "($count)",
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
