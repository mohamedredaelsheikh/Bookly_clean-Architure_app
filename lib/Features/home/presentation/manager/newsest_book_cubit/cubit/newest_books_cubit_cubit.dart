import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_new_book_usecase.dart';
import 'package:flutter/material.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubitCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubitCubit(this.fetchNewsBookUsecase)
      : super(NewestBooksCubitInitial());
  final FetchNewsBookUsecase fetchNewsBookUsecase;

  Future<void> fetchNewestBook() async {
    emit(NewestBooksCubitLoading());
    var result = await fetchNewsBookUsecase.call();
    result.fold((failure) {
      emit(NewestBooksCubitFailure(errorMessage: failure.errormessage));
    }, (books) {
      emit(NewestBooksCubitSuccess(books: books));
    });
  }
}
