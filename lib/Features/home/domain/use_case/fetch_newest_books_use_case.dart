import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});

  @override
  Future<Either<ServerException, List<BookEntity>>> call([void param]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
