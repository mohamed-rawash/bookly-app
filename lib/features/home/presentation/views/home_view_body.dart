import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import 'component/best_seller_list_view_item.dart';
import 'component/custom_app_bar.dart';
import 'component/featured_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FeaturedList(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
                const SizedBox(height: 20),
                const BestSellerListViewItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


