import 'package:dartz/dartz.dart';
import 'package:movies_app/src/helper/failure.dart';

import '../../data/model/response/movie_respons_dto.dart';

abstract class DetailsRepository {
  Future<Either<Failure, MovieResponseDto>> getDetailsMovies(
      {required int movieId});
}

abstract class DetailsRemoteDataSource {
  Future<Either<Failure, MovieResponseDto>> getDetailsMovies(
      {required int movieId});
}
