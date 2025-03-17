import 'dart:developer';

import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/featured_book_cubit/cubit/featuredbookcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  int nextPage = 1;
  int lastFetchedPage = -1;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.6 * maxScrollLength &&
        !isLoading &&
        nextPage > lastFetchedPage) {
      if (!mounted) return;
      log("Fetching page $nextPage...");

      isLoading = true;

      await BlocProvider.of<FeaturedbookcubitCubit>(context)
          .fetchFeaturedBooks(pagenumber: nextPage++);
      lastFetchedPage = nextPage;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        key: const ValueKey('featured_books_list'),
        controller: _scrollController,
        itemCount: widget.books.length + (isLoading ? 1 : 0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == widget.books.length && isLoading) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SpinKitThreeBounce(
                color: Colors.blue,
                size: 24.0,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(
              image: widget.books[index].image ?? '',
            ),
          );
        },
      ),
    );
  }
}
/*

}*/
