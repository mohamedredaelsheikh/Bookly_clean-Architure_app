import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/newsest_book_cubit/cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  int lastFetchedPage = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.6 * maxScrollLength &&
        !isLoading &&
        nextPage > lastFetchedPage) {
      if (!mounted) return;

      isLoading = true;

      await BlocProvider.of<NewestBooksCubitCubit>(context)
          .fetchNewestBook(pagenumber: nextPage++);
      lastFetchedPage = nextPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      itemCount: widget.books.length + (isLoading ? 1 : 0),
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
          padding: EdgeInsets.symmetric(vertical: 10),
          child: NewestBookListViewItem(
            book: widget.books[index],
          ),
        );
      },
    );
  }
}
