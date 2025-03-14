part of 'featuredbookcubit_cubit.dart';

@immutable
sealed class FeaturedbookcubitState {}

final class FeaturedbookcubitInitial extends FeaturedbookcubitState {}

final class FeaturedbookcubitLoading extends FeaturedbookcubitState {}

final class FeaturedbookcubitPaginationLoading extends FeaturedbookcubitState {}

final class FeaturedbookcubitPaginationFailure extends FeaturedbookcubitState {
  final String errorMessage;

  FeaturedbookcubitPaginationFailure({required this.errorMessage});
}

final class FeaturedbookcubitFailure extends FeaturedbookcubitState {
  final String errorMessage;

  FeaturedbookcubitFailure({required this.errorMessage});
}

final class FeaturedbookcubitSuccess extends FeaturedbookcubitState {
  final List<BookEntity> books;

  FeaturedbookcubitSuccess({required this.books});
}
