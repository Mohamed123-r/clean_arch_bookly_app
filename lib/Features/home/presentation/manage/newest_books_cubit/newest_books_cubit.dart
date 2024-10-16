import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_case/fetch_newest_books_use_case.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) => emit(NewestBooksFailed(error: failure.toString())),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
