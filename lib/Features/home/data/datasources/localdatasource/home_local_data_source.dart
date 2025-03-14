import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pagenumber = 0});
  List<BookEntity> fetchNewsBooks();
}
