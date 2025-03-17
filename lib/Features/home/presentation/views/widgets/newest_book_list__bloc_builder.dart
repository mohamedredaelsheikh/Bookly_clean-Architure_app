import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/newsest_book_cubit/cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_book_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/news_list_view_pagination_loading.dart';
import 'package:bookly/core/functions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListBlocConsumer extends StatefulWidget {
  const NewestBooksListBlocConsumer({
    super.key,
  });

  @override
  State<NewestBooksListBlocConsumer> createState() =>
      _NewestBooksListBlocConsumerState();
}

class _NewestBooksListBlocConsumerState
    extends State<NewestBooksListBlocConsumer> {
  List<BookEntity> books = [];
  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubitCubit, NewestBooksCubitState>(
      listener: (context, state) {
        if (state is NewestBooksCubitSuccess) {
          if (mounted) {
            setState(() {
              books.addAll(state.books.where(
                  (newBook) => !books.any((b) => b.bookId == newBook.bookId)));
            });
          }
        } else if (state is NewestBooksCubitPaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(buildErrorWidget(state.errorMessage));
        }
      },
      builder: (context, state) {
        if (state is NewestBooksCubitSuccess ||
            state is NewestBooksCubitPaginationLoading ||
            state is NewestBooksCubitPaginationFailure) {
          return NewestBooksListView(
            books: books,
          );
        } else if (state is NewestBooksCubitFailure) {
          return Text(state.errorMessage);
        } else {
          return NewsLiastViewPaginationLoading();
        }
      },
    );
  }
}
