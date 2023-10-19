import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:movie_app/movies/presentation/view/widget/searched_movie_item.dart';

import '../../controller/search_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var cubit = BlocProvider.of<SearchCubit>(context);
    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 40),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      debounceDelay: const Duration(milliseconds: 500),
      width: isPortrait ? 600 : 500,
      onQueryChanged: (query) {
        cubit.searchMovies(query);
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search_sharp),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchFailure) {
                      return Center(child: Text(state.errMessage.toString()));
                    }
                    if (state is SearchSuccess) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 4),
                        shrinkWrap: true,
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          return SearchedMovieItem(movies: state.movies[index]);
                        },
                      );
                    }
                    if (state is SearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
