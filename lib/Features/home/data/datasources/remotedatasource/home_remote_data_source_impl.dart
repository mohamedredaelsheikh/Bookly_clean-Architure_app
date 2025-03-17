import 'package:bookly/Features/home/data/datasources/remotedatasource/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/functions/get_books_list.dart';
import 'package:bookly/core/functions/saved_books.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:dio/dio.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pagenumber = 0}) async {
    int retries = 3;
    for (int i = 0; i < retries; i++) {
      try {
        var data = await apiService.get(
          endPoint:
              "volumes?filter=free-ebooks&q=programming&startIndex=${pagenumber * 10}",
        );
        List<BookEntity> books = getBooksList(data);
        savedBooks(books, boxname: kFeaturedBox);
        return books;
      } catch (e) {
        if (e is DioException &&
            e.response?.statusCode == 503 &&
            i < retries - 1) {
          await Future.delayed(Duration(seconds: 2));
          continue;
        }
        rethrow;
      }
    }
    throw Exception("Failed after $retries attempts"); // لو فشل كل المحاولات
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks({int pagenumber = 0}) async {
    int retries = 3;
    for (int i = 0; i < retries; i++) {
      try {
        var data = await apiService.get(
            endPoint:
                "volumes?Filtering=free-ebooks&q=programming&sorting=newest&startIndex=${pagenumber * 10}");

        List<BookEntity> books = getBooksList(data);
        savedBooks(books, boxname: kNewestBox);

        return books;
      } catch (e) {
        if (e is DioException &&
            e.response?.statusCode == 503 &&
            i < retries - 1) {
          await Future.delayed(Duration(seconds: 2));
          continue;
        }
        rethrow;
      }
    }
    throw Exception("Failed after $retries attempts"); // لو فشل كل المحاولات
  }
}
