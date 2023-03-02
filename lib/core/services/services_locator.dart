import 'package:get_it/get_it.dart';
import 'package:imdb/movies/presentation/controller/movies_bloc.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/reposirtory/movies_repository.dart';
import '../../movies/domain/reposirtory/base_movies_repository.dart';
import '../../movies/domain/usecases/get_TopRated_Movies_usecase.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_recommendation_usecase.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;


class ServicesLocator {
  void init() {

    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));


    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));


    sl.registerLazySingleton<BaseMoviesRepository>(
            () => MoviesRepository(sl()));


    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
            () => MovieRemoteDataSource());
  }
}

