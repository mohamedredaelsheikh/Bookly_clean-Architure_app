import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/core/utils/circural_progress_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/featured_book_cubit/cubit/featuredbookcubit_cubit.dart';

class FeaturedBooksListBlocBuilder extends StatelessWidget {
  const FeaturedBooksListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedbookcubitCubit, FeaturedbookcubitState>(
      builder: (context, state) {
        if (state is FeaturedbookcubitSuccess) {
          return FeaturedBooksListView();
        } else if (state is FeaturedbookcubitFailure) {
          return Text(state.errorMessage);
        } else {
          return CustomCircularProgressIndecator();
        }
      },
    );
  }
}
