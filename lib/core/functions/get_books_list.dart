import 'package:bookly/Features/home/domain/entities/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var element in data["items"]) {
    books.add(element);
  }
  return books;
}
