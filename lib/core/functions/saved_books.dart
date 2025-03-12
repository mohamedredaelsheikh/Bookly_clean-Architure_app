import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void savedBooks(List<BookEntity> books, {required String boxname}) {
  var box = Hive.box<BookEntity>(boxname);
  box.addAll(books);
}
