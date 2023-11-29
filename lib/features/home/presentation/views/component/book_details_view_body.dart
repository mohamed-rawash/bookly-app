import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/component/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage(AssetsPaths.carouselImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Text(
                "The Jungle Book",
                style: Styles.textStyle30,
              ),
              const Text(
                "Rudyard Kipling",
                style: Styles.textStyle18,
              ),
              const BookRating(),
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
                          r"19$",
                          style: Styles.textStyle20.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "You can also like",
                style: Styles.textStyle20,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => AspectRatio(
                  aspectRatio: 1.2 / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage(AssetsPaths.carouselImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) =>
                const SizedBox(width: 6),
                itemCount: 10,
              ),
            )
          ],
        ),
      ],
    );
  }
}
