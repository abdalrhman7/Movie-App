import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_string.dart';
import '../../../data/models/movies.dart';
import '../widget/now_playing_component.dart';
import '../widget/popular_component.dart';
import '../widget/top_rated_component.dart';
import '../../controller/movie_bloc.dart';
import '../../controller/search_cubit.dart';
import '../widget/CustomSearchBar.dart';
import '../widget/see_more_component.dart';
import 'movie_detail_screen.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (BuildContext context) => sl<MovieBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
        BlocProvider<SearchCubit>(
          create: (BuildContext context) => sl<SearchCubit>(),
        ),
      ],
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NowPlayingComponent(),
                  SeeMoreComponent(text: AppString.popular),
                  PopularComponent(),
                  SeeMoreComponent(text: AppString.topRated),
                  TopRatedComponent(),
                  SizedBox(height: 50),
                ],
              ),
            ),
            CustomSearchBar()
          ],
        ),
      ),
    );
  }
}




