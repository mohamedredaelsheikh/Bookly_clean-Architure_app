import 'dart:developer';

import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  if (data["items"] != null) {
    for (var element in data["items"]) {
      try {
        books.add(BookModel.fromJson(element));
      } catch (e) {
        log("Error parsing book item: $e");
      }
    }
  }
  return books;
}
