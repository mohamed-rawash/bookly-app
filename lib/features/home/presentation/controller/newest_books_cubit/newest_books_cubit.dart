import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model.dart';
import '../../../data/repository/home_repository_impl.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepository) : super(NewestBooksInitial());
  HomeRepositoryImpl homeRepository;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    final result = await homeRepository.fetchNewestBooks();
    result.fold((l) => emit(NewestBooksFailure(l.errorMessage),), (r) => emit(NewestBooksSuccess(r),),);
  }

}
