import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_feature_book_usecase.dart';
import 'package:flutter/material.dart';

part 'featuredbookcubit_state.dart';

class FeaturedbookcubitCubit extends Cubit<FeaturedbookcubitState> {
  final FetchFeatureBookUsecase fetchFeatureBookUsecase;

  FeaturedbookcubitCubit(this.fetchFeatureBookUsecase)
      : super(FeaturedbookcubitInitial());

  Future<void> fetchFeaturedBooks({int pagenumber = 0}) async {
    if (pagenumber == 0) {
      emit(FeaturedbookcubitLoading());
    } else {
      emit(FeaturedbookcubitPaginationLoading());
    }

    log("Fetching books for page $pagenumber...");
    var result = await fetchFeatureBookUsecase.call(pagenumber);

    result.fold((failure) {
      if (pagenumber == 0) {
        emit(FeaturedbookcubitFailure(errorMessage: failure.errormessage));
      } else {
        emit(FeaturedbookcubitPaginationFailure(
            errorMessage: failure.errormessage));
      }
    }, (books) {
      emit(FeaturedbookcubitSuccess(books: books));
    });
  }
}
