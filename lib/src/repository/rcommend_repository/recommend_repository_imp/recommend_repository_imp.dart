import 'package:dartz/dartz.dart';
import '../../../data/model/response/movie_respons_dto.dart';
import '../../../helper/failure.dart';
import '../recommend_repository_contract.dart';

class RecommendRepositoryImp implements RecommendRepository {
  RecommendRemoteDataSource remoteDataSource;
  RecommendRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, MovieResponseDto>> getRecommend() {
    return remoteDataSource.getRecommend();
  }
}
