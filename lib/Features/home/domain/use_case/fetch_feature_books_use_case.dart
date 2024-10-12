import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase({required this.homeRepo});

  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks() {
    return homeRepo.fetchFeatureBooks();
  }
}
