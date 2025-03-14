import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                image: books[index].image ?? " ",
              ),
            );
          }),
    );
  }
}
