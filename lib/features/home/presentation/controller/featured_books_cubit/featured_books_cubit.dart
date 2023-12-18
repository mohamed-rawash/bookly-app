import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/repository/home_repository.dart';
import 'package:bookly/features/home/data/repository/home_repository_impl.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepository) : super(FeaturedBooksInitial());
  HomeRepositoryImpl homeRepository;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await homeRepository.fetchFeaturedBooks();
    print(result);
    result.fold((l) {
      print(l.errorMessage);
      emit(FeaturedBooksFailure(l.errorMessage));
    }, (r) => emit(FeaturedBooksSuccess(r)));
  }
}
