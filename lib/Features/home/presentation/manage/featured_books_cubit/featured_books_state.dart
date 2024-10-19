part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksFailed extends FeaturedBooksState {
  final String error;

  FeaturedBooksFailed({required this.error});
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess({required this.books});
}

class FeaturedPaginationFailed extends FeaturedBooksState {
  final String error;

  FeaturedPaginationFailed({required this.error});
}

class FeaturedPaginationLoading extends FeaturedBooksState {}
