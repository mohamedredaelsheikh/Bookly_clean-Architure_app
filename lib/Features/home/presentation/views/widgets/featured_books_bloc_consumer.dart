import 'dart:developer';

import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_book_list_view_pagination_loading.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/core/functions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/featured_book_cubit/cubit/featuredbookcubit_cubit.dart';

class FeaturedBooksListBlocConsumer extends StatefulWidget {
  const FeaturedBooksListBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListBlocConsumer> createState() =>
      _FeaturedBooksListBlocConsumerState();
}

class _FeaturedBooksListBlocConsumerState
    extends State<FeaturedBooksListBlocConsumer> {
  List<BookEntity> books = [];
  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedbookcubitCubit, FeaturedbookcubitState>(
      listener: (context, state) {
        if (state is FeaturedbookcubitSuccess) {
          log("Success: Adding ${state.books.length} books to existing ${books.length}");
          if (mounted) {
            setState(() {
              books.addAll(state.books.where(
                  (newBook) => !books.any((b) => b.bookId == newBook.bookId)));
            });
          }
        } else if (state is FeaturedbookcubitPaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(buildErrorWidget(state.errorMessage));
        }
      },
      builder: (context, state) {
        if (state is FeaturedbookcubitSuccess ||
            state is FeaturedbookcubitPaginationLoading ||
            state is FeaturedbookcubitPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedbookcubitFailure) {
          return Text(state.errorMessage);
        } else {
          return FeaturedBookListViewPaginationLoading();
        }
      },
    );
  }
}
