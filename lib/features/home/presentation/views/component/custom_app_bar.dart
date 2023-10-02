import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/search.svg"),
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
