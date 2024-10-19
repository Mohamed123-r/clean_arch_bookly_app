import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_case/fetch_feature_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeatureBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedPaginationLoading());
    }
    var result = await fetchFeaturedBooksUseCase.call(pageNum);
    result.fold(
      (failure) {
        if (pageNum == 0) {
          emit(FeaturedBooksFailed(error: failure.message));
        } else {
          emit(FeaturedPaginationFailed(error: failure.message));
        }
      },
      (books) => emit(FeaturedBooksSuccess(books: books)),
    );
  }
}
