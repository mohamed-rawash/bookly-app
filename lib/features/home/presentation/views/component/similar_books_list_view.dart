import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_image_loading.dart';
import 'package:bookly/features/home/presentation/controller/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/component/featured_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if(state is SimilarBooksSuccess) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => AspectRatio(
                aspectRatio: 1.2 / 2,
                child: FeaturedListItem(book: state.books[index],),),
              separatorBuilder: (context, index) => const SizedBox(width: 6),
              itemCount: state.books.length,
            );
          } else if (state is SimilarBooksFailure){
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustomImageLoading(height: MediaQuery.of(context).size.height * 0.15, width: 100,),
              separatorBuilder: (context, index) => const SizedBox(
                width: 14,
              ),
              itemCount: 5,
            );
          }
        },
      ),
    );
  }
}
