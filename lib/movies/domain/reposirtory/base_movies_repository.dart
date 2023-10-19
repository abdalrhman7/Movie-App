import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/models/movies.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';
import '../entities/recommendation.dart';
import '../usecases/get_movie_details_usecase.dart';
import '../usecases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {

  Future<Either<Failure,List<Movie>>> getNowPlaying();

  Future<Either<Failure,List<Movie>>> getPopularMovie();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetail>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);

  Future<Either<Failure, List<Movies>>> search(String searchKeyWord);
}