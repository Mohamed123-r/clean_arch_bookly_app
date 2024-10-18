import 'dart:developer';

import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    try {
      int startIndex = pageNumber * 10;
      int endIndex = (pageNumber + 1) * 10;

      var box = Hive.box<BookEntity>(kFeatureBox);
      int length = box.values.length;
      if (startIndex >= length || endIndex > length) {
        return [];
      }
      return box.values.toList().sublist(startIndex, endIndex);
    } catch (e) {
      log(e.toString()); // Incorrect way to access error message
      return [];}
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
