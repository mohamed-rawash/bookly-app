import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepository) : super(FeaturedBooksInitial());
  HomeRepository homeRepository;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await homeRepository.fetchFeaturedBooks();
    result.fold((l) => emit(FeaturedBooksFailure(l.errorMessage)), (r) => emit(FeaturedBooksSuccess(r)));
  }
}
