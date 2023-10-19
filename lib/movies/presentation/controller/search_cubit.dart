import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../../data/models/movies.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/usecases/search_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());

  final SearchUseCase searchUseCase;

  FutureOr<void> searchMovies(String searchKeyWord) async {
    emit(SearchLoading());
    final result = await searchUseCase(searchKeyWord);
    result.fold((l) => emit(SearchFailure(l)), (r) => emit(SearchSuccess(r)));
  }
}
