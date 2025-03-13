part of 'newest_books_cubit_cubit.dart';

@immutable
sealed class NewestBooksCubitState {}

final class NewestBooksCubitInitial extends NewestBooksCubitState {}

final class NewestBooksCubitLoading extends NewestBooksCubitState {}

final class NewestBooksCubitFailure extends NewestBooksCubitState {
  final String errormessage;

  NewestBooksCubitFailure({required this.errormessage});
}

final class NewestBooksCubitSuccess extends NewestBooksCubitState {
  final List<BookEntity> books;

  NewestBooksCubitSuccess({required this.books});
}
