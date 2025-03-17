import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void savedBooks(List<BookEntity> books, {required String boxname}) {
  var box = Hive.box<BookEntity>(boxname);

  for (var book in books) {
    if (!box.values.any((existingBook) => existingBook.bookId == book.bookId)) {
      box.add(book);
    }
  }
}
