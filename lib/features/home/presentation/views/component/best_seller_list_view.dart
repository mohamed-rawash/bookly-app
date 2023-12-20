import 'package:bookly/core/widgets/custom_Book_item_loading.dart';
import 'package:bookly/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/component/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
          if (state is NewestBooksSuccess) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => BestSellerListViewItem(book: state.books[index],),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: state.books.length,
            );
          } else if (state is NewestBooksFailure)
          {
            return  Center(child: CustomErrorWidget(errorMessage: state.errorMessage));
          }
          else {
            return ListView.separated(
              itemBuilder: (context, index) => const CustomBookItemLoading(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 14,
              ),
              itemCount: 4,
            );
          }
        },
      ),
    );
  }
}
