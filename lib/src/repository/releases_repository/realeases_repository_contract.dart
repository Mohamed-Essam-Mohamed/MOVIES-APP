import 'package:dartz/dartz.dart';

import '../../data/model/response/movie_respons_dto.dart';
import '../../helper/failure.dart';

abstract class ReleaseRepository {
  Future<Either<Failure, MovieResponseDto>> getReleases();
}

abstract class ReleasesRemoteDataSource {
  Future<Either<Failure, MovieResponseDto>> getReleases();
}
