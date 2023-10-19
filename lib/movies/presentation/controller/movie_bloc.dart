import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecases/get_TopRated_Movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies_usecase.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;

  MovieBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )), (r) {
      emit(state.copyWith(
        popularMovie: r,
        popularState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )), (r) {
      emit(state.copyWith(
        topRatedMovie: r,
        topRatedState: RequestState.loaded,
      ));
    });
  }
}
