import 'package:bookly/Features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manage/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manage/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Features/home/domain/entities/book_entity.dart';
import 'Features/home/domain/use_case/fetch_feature_books_use_case.dart';
import 'core/api/function.dart';
import 'core/api/simple_bloc_observer.dart';
import 'core/database/cache/cache_helper.dart';

void main() async {
  runApp(const Bookly());
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeatureBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBooksCubit(
            FetchFeatureBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks();
        }),
        BlocProvider(create: (context) {
          return NewestBooksCubit(
            FetchNewestBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchNewestBooks();
        }),
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
