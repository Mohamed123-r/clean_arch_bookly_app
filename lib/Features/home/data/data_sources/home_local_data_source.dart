import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks();

  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBooks() {
    var box = Hive.box<BookEntity>(kFeatureBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
