import 'package:bookly/Features/home/presentation/views/similar_books_list_view.dart';
import 'package:bookly/core/utils/circural_progress_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/featured_book_cubit/cubit/featuredbookcubit_cubit.dart';

class SimilarBooksListBlocBuilder extends StatelessWidget {
  const SimilarBooksListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedbookcubitCubit, FeaturedbookcubitState>(
      builder: (context, state) {
        if (state is FeaturedbookcubitSuccess) {
          return SimilarBooksListview(
            books: state.books,
          );
        } else if (state is FeaturedbookcubitFailure) {
          return Text(state.errorMessage);
        } else {
          return CustomCircularProgressIndecator();
        }
      },
    );
  }
}
