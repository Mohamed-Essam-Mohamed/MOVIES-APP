import 'package:dartz/dartz.dart';

import '../../data/model/response/movie_respons_dto.dart';
import '../../helper/failure.dart';

abstract class SearchRepository {
  Future<Either<Failure, MovieResponseDto>> getMoviesSearchQuery(
      {required String query, required int page});
}

abstract class SearchRemoteDataSource {
  Future<Either<Failure, MovieResponseDto>> getMoviesSearchQuery(
      {required String query, required int page});
}
