import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';

abstract class BrowseRepository {
  Future<Either<Failure, MovieResponseDto>> getGenreId(
      {required int genreId, required int page});
}

abstract class BrowseRemoteDataSource {
  Future<Either<Failure, MovieResponseDto>> getGenreId(
      {required int genreId, required int page});
}
