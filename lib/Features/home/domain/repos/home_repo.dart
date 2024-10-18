import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ServerException, List<BookEntity>>> fetchFeatureBooks(
      {int pageNum = 0});

  Future<Either<ServerException, List<BookEntity>>> fetchNewestBooks();
}
