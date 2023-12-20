import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentation/views/component/best_seller_list_view_item.dart';
import 'package:bookly/features/home/presentation/views/component/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.22),
                child: AspectRatio(
                  aspectRatio: 1.2 / 2,
                  child: CustomBookImage(
                      imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? ""),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
               Text(
                book.volumeInfo?.title??'Unknown',
                style: Styles.textStyle30,
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
              ),
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
              const BookRating(rating: '0', count: 0,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Card(
                clipBehavior: Clip.hardEdge,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        child: Text(
                          "Free",
                          style: Styles.textStyle20.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          Uri url = Uri.parse(book.volumeInfo!.previewLink!);
                          if(await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        child: const Text(
                          "Free Preview",
                          style: Styles.textStyle20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox(height: MediaQuery.of(context).size.height * 0.03)),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "You can also like",
                style: Styles.textStyle20,
              ),
            ),
            SimilarBooksListView(),
          ],
        ),
      ],
    );
  }
}
