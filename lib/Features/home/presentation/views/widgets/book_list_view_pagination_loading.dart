import 'package:bookly/Features/home/presentation/views/widgets/custom_image_progress_indecator.dart';
import 'package:flutter/material.dart';

class BookListViewPaginationLoading extends StatelessWidget {
  const BookListViewPaginationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CustomImageProgressIndecator());
          }),
    );
  }
}
