import 'package:bookly/Features/home/data/models/book_model/Book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookModel>> fetchFeatureBooks();

  Future<List<BookModel>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<BookModel>> fetchFeatureBooks() {
    // TODO: implement fetchFeatureBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
