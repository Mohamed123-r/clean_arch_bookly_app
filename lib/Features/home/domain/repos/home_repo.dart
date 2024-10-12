import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> fetchFeatureBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}
