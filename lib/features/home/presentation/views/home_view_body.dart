import 'package:bookly/features/home/presentation/views/component/best_seller_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import 'component/custom_app_bar.dart';
import 'component/featured_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedList(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    "Best Seller",
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverFillRemaining(
            child: BestSellerListView(),
          ),
        ],
      )
    );
  }
}


