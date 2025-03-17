import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_new_book_usecase.dart';
import 'package:flutter/material.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubitCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubitCubit(this.fetchNewsBookUsecase)
      : super(NewestBooksCubitInitial());
  final FetchNewsBookUsecase fetchNewsBookUsecase;

  Future<void> fetchNewestBook({int pagenumber = 0}) async {
    if (pagenumber == 0) {
      emit(NewestBooksCubitLoading());
    } else {
      emit(NewestBooksCubitPaginationLoading());
    }
    log("Fetching books for page $pagenumber...");

    var result = await fetchNewsBookUsecase.call(pagenumber);
    result.fold((failure) {
      if (pagenumber == 0) {
        emit(NewestBooksCubitFailure(errorMessage: failure.errormessage));
      } else {
        emit(NewestBooksCubitPaginationFailure(
            errorMessage: failure.errormessage));
      }
    }, (books) {
      emit(NewestBooksCubitSuccess(books: books));
    });
  }
}
