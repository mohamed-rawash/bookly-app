import 'package:bookly/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("assets/images/Logo.svg",
            semanticsLabel: 'Acme Logo',
            width: 100,
          ),
          IconButton(
            onPressed: () => context.push(AppRouter.searchViewPath),
            icon: SvgPicture.asset("assets/images/search.svg"),
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
