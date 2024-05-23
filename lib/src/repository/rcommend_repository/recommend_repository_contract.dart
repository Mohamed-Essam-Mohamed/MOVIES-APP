import 'package:dartz/dartz.dart';

import '../../data/model/response/movie_respons_dto.dart';
import '../../helper/failure.dart';

abstract class RecommendRepository {
  Future<Either<Failure, MovieResponseDto>> getRecommend();
}

abstract class RecommendRemoteDataSource {
  Future<Either<Failure, MovieResponseDto>> getRecommend();
}
