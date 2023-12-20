import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model.dart';
import '../../../data/repository/home_repository_impl.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepository) : super(SimilarBooksInitial());
  HomeRepositoryImpl homeRepository;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    final result = await homeRepository.fetchSimilarBooks(category: category);
    result.fold((l) => emit(SimilarBooksFailure(l.errorMessage),), (r) => emit(SimilarBooksSuccess(r),),);
  }
}
