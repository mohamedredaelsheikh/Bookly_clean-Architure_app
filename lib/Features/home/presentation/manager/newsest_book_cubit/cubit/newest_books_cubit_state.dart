part of 'newest_books_cubit_cubit.dart';

@immutable
sealed class NewestBooksCubitState {}

final class NewestBooksCubitInitial extends NewestBooksCubitState {}

final class NewestBooksCubitLoading extends NewestBooksCubitState {}

final class NewestBooksCubitPaginationLoading extends NewestBooksCubitState {}

final class NewestBooksCubitPaginationFailure extends NewestBooksCubitState {
  final String errorMessage;

  NewestBooksCubitPaginationFailure({required this.errorMessage});
}

final class NewestBooksCubitFailure extends NewestBooksCubitState {
  final String errorMessage;

  NewestBooksCubitFailure({required this.errorMessage});
}

final class NewestBooksCubitSuccess extends NewestBooksCubitState {
  final List<BookEntity> books;

  NewestBooksCubitSuccess({required this.books});
}
