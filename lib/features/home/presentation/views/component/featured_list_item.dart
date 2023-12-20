import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_router.dart';
import 'custom_book_image.dart';

class FeaturedListItem extends StatelessWidget {
  const FeaturedListItem({super.key, required this.book});
final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.bookDetailsViewPath, extra: book),
      child: CustomBookImage(
        imageUrl: book.volumeInfo?.imageLinks?.thumbnail??"",
      ),
    );
  }
}
