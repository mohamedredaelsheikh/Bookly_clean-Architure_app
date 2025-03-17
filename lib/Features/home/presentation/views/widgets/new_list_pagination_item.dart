import 'package:bookly/Features/home/presentation/views/widgets/custom_image_progress_indecator.dart';
import 'package:flutter/material.dart';

class NewListPaginationItem extends StatelessWidget {
  const NewListPaginationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          CustomImageLoadingIndecator(),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
