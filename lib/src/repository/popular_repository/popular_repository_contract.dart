import 'package:dartz/dartz.dart';
import '../../data/model/response/movie_respons_dto.dart';
import '../../helper/failure.dart';

abstract class PopularRepository {
  Future<Either<Failure, MovieResponseDto>> getPopularMovies();
}

abstract class PopularRemoteDataSource {
  Future<Either<Failure, MovieResponseDto>> getPopularMovies();
}
