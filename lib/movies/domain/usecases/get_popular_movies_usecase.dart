import 'package:dartz/dartz.dart';

import 'package:imdb/core/error/failure.dart';

import '../../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';
import '../reposirtory/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}