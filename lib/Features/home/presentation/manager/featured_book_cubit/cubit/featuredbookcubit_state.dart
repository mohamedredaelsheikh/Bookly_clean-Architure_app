part of 'featuredbookcubit_cubit.dart';

@immutable
sealed class FeaturedbookcubitState {}

final class FeaturedbookcubitInitial extends FeaturedbookcubitState {}

final class FeaturedbookcubitLoading extends FeaturedbookcubitState {}

final class FeaturedbookcubitFailure extends FeaturedbookcubitState {
  final String errorMessage;

  FeaturedbookcubitFailure({required this.errorMessage});
}

final class FeaturedbookcubitSuccess extends FeaturedbookcubitState {
  final List<BookEntity> books;

  FeaturedbookcubitSuccess({required this.books});
}
