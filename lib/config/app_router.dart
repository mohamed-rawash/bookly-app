import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentation/controller/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/utils/services_locator.dart';
import '../features/search/presentation/views/search_view.dart';
import '../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const homeViewPath = '/homeView';
  static const bookDetailsViewPath = '/bookDetailsView';
  static const searchViewPath = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeViewPath,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsViewPath,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => sl<SimilarBooksCubit>(),
              child: BookDetailsView(book: state.extra as BookModel,),
            ),
      ),
      GoRoute(
        path: searchViewPath,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}