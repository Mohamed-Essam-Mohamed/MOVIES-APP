import 'package:dartz/dartz.dart';

import '../../data/model/response/movie_respons_dto.dart';
import '../../helper/failure.dart';

abstract class SimilarRepository {
  Future<Either<Failure, MovieResponseDto>> getSimilarMovies(
      {required int movieId});
}

abstract class SimilarRemoteDataSource {
  Future<Either<Failure, MovieResponseDto>> getSimilarMovies(
      {required int movieId});
}
