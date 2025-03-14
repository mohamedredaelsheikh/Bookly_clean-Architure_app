import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          itemCount: books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(AppRouter.kBookDetailsView, extra: books[index]);
                },
                child: CustomBookImage(
                  image: books[index].image ?? "",
                ),
              ),
            );
          }),
    );
  }
}
