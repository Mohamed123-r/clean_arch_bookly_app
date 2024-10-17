import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manage/featured_books_cubit/featured_books_cubit.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return const FeaturedBooksListView();
        } else if (state is FeaturedBooksFailed) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
