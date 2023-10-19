part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
 final List<Movies> movies;

  SearchSuccess(this.movies);
}

class SearchFailure extends SearchState {
 final Failure errMessage;

  SearchFailure(this.errMessage);
}
