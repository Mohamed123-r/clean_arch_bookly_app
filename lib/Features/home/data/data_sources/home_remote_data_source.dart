import 'package:bookly/Features/home/data/models/book_model/Book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/api/api_consumer.dart';
import 'package:bookly/core/api/end_point.dart';
import 'package:bookly/core/api/function.dart';


abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks({int pageNum = 0});

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
   final ApiConsumer api;

  HomeRemoteDataSourceImpl({required this.api});

  @override
  Future<List<BookEntity>> fetchFeatureBooks({int pageNum = 0}) async {
    var data = await api.get("https://www.googleapis.com/books/v1/volumes?q=newest&startIndex=${pageNum*10}");

    List<BookEntity> books = getBookList(data);

    saveBoxData(books, kFeatureBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await api.get(EndPoint.newsBooks);

    List<BookEntity> books = getBookList(data);
    saveBoxData(books, kNewestBox);
    return books;
  }
}

List<BookEntity> getBookList(data) {
  List<BookEntity> books = [];

  for (var item in data['items']) {
    books.add(BookModel.fromJson(item));
  }
  return books;
}
