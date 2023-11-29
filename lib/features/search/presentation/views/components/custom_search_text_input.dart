import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildSearchTextInputBorder(),
        focusedBorder: buildSearchTextInputBorder(),
        fillColor: Colors.black26,
        filled: true,
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 24,
          ),
        ),
      ),
      onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
  OutlineInputBorder buildSearchTextInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.amber,
          width: 2
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}