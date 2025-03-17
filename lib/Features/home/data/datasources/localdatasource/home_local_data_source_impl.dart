import 'package:bookly/Features/home/data/datasources/localdatasource/home_local_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pagenumber = 0}) {
    int startIndex = pagenumber * 10;
    int endIndex = (pagenumber + 1) * 10;

    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;

    if (startIndex > length || endIndex > length) {
      return [];
    } else {
      return box.values.toList().sublist(startIndex, endIndex);
    }
  }

  @override
  List<BookEntity> fetchNewsBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
