import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/error/error_model.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;

  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<ServerException, List<BookEntity>>> fetchFeatureBooks() async {
    try {
      List<BookEntity> bookList;
      bookList = homeLocalDataSource.fetchFeatureBooks();

      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchFeatureBooks();
      return right(bookList);
    } catch (e) {
      return left(
        ServerException(errorModel: ErrorModel.fromJson(e)),
      );
    }
  }

  @override
  Future<Either<ServerException, List<BookEntity>>> fetchNewestBooks() async {
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
        ServerException(errorModel: ErrorModel.fromJson(e)),
      );
    }
  }
}
