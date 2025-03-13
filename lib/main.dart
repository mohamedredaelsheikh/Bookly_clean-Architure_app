import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_feature_book_usecase.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_new_book_usecase.dart';
import 'package:bookly/Features/home/presentation/manager/featured_book_cubit/cubit/featuredbookcubit_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/newsest_book_cubit/cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedbookcubitCubit(
            FetchFeatureBookUsecase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          ),
        ),
        BlocProvider(
            create: (context) => NewestBooksCubitCubit(
                  FetchNewsBookUsecase(
                    homeRepo: getIt.get<HomeRepoImpl>(),
                  ),
                )),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
