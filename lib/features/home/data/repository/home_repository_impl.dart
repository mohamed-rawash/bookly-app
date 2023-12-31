import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl implements HomeRepository {
  
  final ApiService apiService;

  HomeRepositoryImpl(this.apiService);
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      final data = await apiService.get(endPoint: "volumes?q=subject:computer science&Filtering=free-ebooks&Sorting=newest");
      print(data["items"]);
      return right(List<BookModel>.from((data['items'] as List).map((e) => BookModel.fromJson(e))));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final data = await apiService.get(endPoint: "volumes?q=subject:Programming&Filtering=free-ebooks");
      return right(List<BookModel>.from((data['items'] as List).map((e) => BookModel.fromJson(e))));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure('Opps there was an error, Please try again!'));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {
    try {
      final data = await apiService.get(endPoint: "volumes?q=subject:computer science&Filtering=free-ebooks&Sorting=relevance");
      print("******************************************************");
      print(data["items"]);
      return right(List<BookModel>.from((data['items'] as List).map((e) => BookModel.fromJson(e))));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}