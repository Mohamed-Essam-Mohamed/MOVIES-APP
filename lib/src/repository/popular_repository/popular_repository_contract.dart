import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';

abstract class PopularRepository {
  Future<Either<Failure, MovieResponseDto>> getPopularMovies();
}

abstract class PopularRemoteDataSource {
  Future<Either<Failure, MovieResponseDto>> getPopularMovies();
}
