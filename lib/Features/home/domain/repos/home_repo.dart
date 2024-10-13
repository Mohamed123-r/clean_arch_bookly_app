import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ServerException, List<BookEntity>>> fetchFeatureBooks();

  Future<Either<ServerException, List<BookEntity>>> fetchNewestBooks();
}
