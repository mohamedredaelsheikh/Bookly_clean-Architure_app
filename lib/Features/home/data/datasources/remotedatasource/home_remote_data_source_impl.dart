import 'package:bookly/Features/home/data/datasources/remotedatasource/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/functions/get_books_list.dart';
import 'package:bookly/core/utils/api_service.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=programming");

    List<BookEntity> books = getBooksList(data);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
    var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=programming&sorting=newest");

    List<BookEntity> books = getBooksList(data);

    return books;
  }
}
