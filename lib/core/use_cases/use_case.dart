import 'package:bookly/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<ServerException, Type>> call([Param param]);
}
