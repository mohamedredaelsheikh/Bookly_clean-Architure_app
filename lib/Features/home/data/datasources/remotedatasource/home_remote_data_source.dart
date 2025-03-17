import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pagenumber = 0});
  Future<List<BookEntity>> fetchNewsBooks({int pagenumber = 0});
}
