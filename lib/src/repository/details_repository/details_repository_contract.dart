import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';

abstract class DetailsRepository {
  Future<Either<Failure, MovieDetailsResponseDto>> getDetailsMovies(
      {required int movieId});
}

abstract class DetailsRemoteDataSource {
  Future<Either<Failure, MovieDetailsResponseDto>> getDetailsMovies(
      {required int movieId});
}
