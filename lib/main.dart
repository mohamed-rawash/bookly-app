import 'package:bookly/constance.dart';
import 'package:bookly/features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/services_locator.dart';

void main() {
  ServicesLocator.init();
  Bloc.observer = AppBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FeaturedBooksCubit(sl())..fetchFeaturedBooks()),
        BlocProvider(create: (_) => NewestBooksCubit(sl())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor
          ),
          textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme)
        ),
      ),
    );
  }
}

