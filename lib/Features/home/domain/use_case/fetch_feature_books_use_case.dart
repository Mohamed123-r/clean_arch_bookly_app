import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase({required this.homeRepo});

  @override
  Future<Either<ServerException, List<BookEntity>>> call(
      [int param = 0]) async {
    return await homeRepo.fetchFeatureBooks(
      pageNum: param,
    );
  }
}
