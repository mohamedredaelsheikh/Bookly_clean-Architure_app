import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case_with_paramters.dart';
import 'package:dartz/dartz.dart';

class FetchNewsBookUsecase extends UseCaseWithParamters<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewsBookUsecase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pagenumber = 0]) {
    return homeRepo.fetchNewsBooks(pagenumber: pagenumber);
  }
}
