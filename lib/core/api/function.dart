import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBoxData(List<BookEntity> books, String nameBox) {
  var box = Hive.box(nameBox);
  box.addAll(books);
}