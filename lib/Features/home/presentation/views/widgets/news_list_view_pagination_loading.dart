import 'package:bookly/Features/home/presentation/views/widgets/new_list_pagination_item.dart';
import 'package:bookly/core/widgets/custom_fade_animation_widget.dart';
import 'package:flutter/material.dart';

class NewsLiastViewPaginationLoading extends StatelessWidget {
  const NewsLiastViewPaginationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeAnimationWidget(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: NewListPaginationItem());
        },
      ),
    );
  }
}
