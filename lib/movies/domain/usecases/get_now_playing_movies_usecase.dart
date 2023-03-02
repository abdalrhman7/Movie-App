import 'package:dartz/dartz.dart';
import 'package:imdb/core/error/failure.dart';
import 'package:imdb/movies/domain/entities/movie.dart';

import '../../../core/usecase/base_usecase.dart';
import '../reposirtory/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}