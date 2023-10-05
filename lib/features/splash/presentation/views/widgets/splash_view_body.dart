import 'package:bookly/constance.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    initScaleAnimations();
    navigateToHome();
  }

  void initScaleAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), (){
      context.push("/homeView");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  ScaleTransition(
        scale: _animation,
        child:  Image.asset(AssetsPaths.logo),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
