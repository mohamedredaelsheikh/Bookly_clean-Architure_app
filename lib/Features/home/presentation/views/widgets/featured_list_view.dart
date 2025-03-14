import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/featured_book_cubit/cubit/featuredbookcubit_cubit.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  int nextpage = 1;
  bool isloading = false;

  @override
  void setState(VoidCallback fn) {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.setState(fn);
  }

  void _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxPosition = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxPosition * 0.7) {
      isloading = true;
      await BlocProvider.of<FeaturedbookcubitCubit>(context)
          .fetchFeaturedBooks(pagenumber: nextpage++);
      isloading = false;
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
          controller: _scrollController,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,
                      extra: widget.books[index]);
                },
                child: CustomBookImage(
                  image: widget.books[index].image ?? "",
                ),
              ),
            );
          }),
    );
  }
}
