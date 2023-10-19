import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../../data/models/movies.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';
import '../reposirtory/base_movies_repository.dart';

class SearchUseCase extends BaseUseCase<List<Movies> , String> {
  final BaseMoviesRepository baseMoviesRepository;

  SearchUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(String parameters) async{
    return await baseMoviesRepository.search(parameters);
  }

}


