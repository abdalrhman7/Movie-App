part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class GetNowPlayingMoviesEvent extends MovieEvent{}

class GetPopularMoviesEvent extends MovieEvent{}

class GetTopRatedMoviesEvent extends MovieEvent{}

class SearchMoviesEvent extends MovieEvent{}
