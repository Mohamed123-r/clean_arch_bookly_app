import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/widgets/custom_featured_books_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manage/featured_books_cubit/featured_books_cubit.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedPaginationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedPaginationLoading ||
            state is FeaturedPaginationFailed) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailed) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return CustomFeaturedBooksLoading();
        }
      },
    );
  }
}
