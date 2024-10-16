part of 'newest_books_cubit.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess({required this.books});
}

class NewestBooksFailed extends NewestBooksState {
  final String error;

  NewestBooksFailed({required this.error});
}

class NewestBooksLoading extends NewestBooksState {}
