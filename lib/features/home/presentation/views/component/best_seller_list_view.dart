import 'package:bookly/features/home/presentation/views/component/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const BestSellerListViewItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: 10,
      ),
    );
  }
}
