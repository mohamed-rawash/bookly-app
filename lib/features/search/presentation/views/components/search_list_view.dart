import 'package:flutter/material.dart';


class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Text(""),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 10,
    );
  }
}
