import 'package:bookly/Features/home/presentation/manager/newsest_book_cubit/cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_book_list_view.dart';
import 'package:bookly/core/utils/circural_progress_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListBlocBuilder extends StatelessWidget {
  const NewestBooksListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubitCubit, NewestBooksCubitState>(
      builder: (context, state) {
        if (state is NewestBooksCubitSuccess) {
          return NewestBooksListView(
            books: state.books,
          );
        } else if (state is NewestBooksCubitFailure) {
          return Text(state.errorMessage);
        } else {
          return CustomCircularProgressIndecator();
        }
      },
    );
  }
}
