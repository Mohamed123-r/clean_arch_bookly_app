import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';

import 'package:bookly/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;

  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks(
      {int pageNum = 0}) async {
    try {
      List<BookEntity> bookList;
      bookList = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNum);

      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchFeatureBooks(pageNum: pageNum);
      return right(bookList);
    } catch (e) {
      return left(
       ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> bookList;
     bookList = homeLocalDataSource.fetchNewestBooks();
     if (bookList.isNotEmpty) {
       return right(bookList);
     }
      bookList = await homeRemoteDataSource.fetchNewestBooks();
      return right(bookList);
    } catch (e) {
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
