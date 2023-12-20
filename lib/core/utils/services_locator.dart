import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/repository/home_repository.dart';
import 'package:bookly/features/home/data/repository/home_repository_impl.dart';
import 'package:bookly/features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init(){
    //cubits
    sl.registerFactory(() => FeaturedBooksCubit(sl()));
    sl.registerFactory(() => NewestBooksCubit(sl()));
    
    //repositories
    sl.registerLazySingleton<HomeRepositoryImpl>(() => HomeRepositoryImpl(sl()));
    
    //Api Service
    sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

    //dio
    sl.registerLazySingleton<Dio>(() => Dio());
    
  }
}