import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseWithParamters<Type, Paramter> {
  Future<Either<Failure, Type>> call(Paramter paramter);
}
