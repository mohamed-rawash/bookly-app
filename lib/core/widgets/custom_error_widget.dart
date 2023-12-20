
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
