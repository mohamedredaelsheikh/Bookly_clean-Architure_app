import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseWithParamters<Type, pagenumber> {
  Future<Either<Failure, Type>> call(pagenumber paramter);
}
