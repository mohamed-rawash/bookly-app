import 'package:bookly/core/widgets/custom_image_loading.dart';
import 'package:bookly/features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/component/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'featured_list_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) => FeaturedListItem(book: state.books[index],),
              separatorBuilder: (context, index) => const SizedBox(
                width: 14,
              ),
            );
          } else if (state is FeaturedBooksFailure) {
            return  Center(child: CustomErrorWidget(errorMessage: state.errorMessage));
          } else {
            return ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const CustomImageLoading(),
              separatorBuilder: (context, index) => const SizedBox(
                width: 14,
              ),
              itemCount: 4,
            );
          }
        },
      ),
    );
  }
}
