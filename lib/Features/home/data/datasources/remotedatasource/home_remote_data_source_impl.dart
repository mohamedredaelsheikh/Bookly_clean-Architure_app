import 'package:bookly/Features/home/data/datasources/remotedatasource/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/functions/get_books_list.dart';
import 'package:bookly/core/functions/saved_books.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/constants.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pagenumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&q=programming&startIndex=${pagenumber * 10}");

    List<BookEntity> books = getBooksList(data);

    savedBooks(books, boxname: kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
    var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=programming&sorting=newest");

    List<BookEntity> books = getBooksList(data);
    savedBooks(books, boxname: kNewestBox);

    return books;
  }
}
