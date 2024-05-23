import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/rcommend_repository/recommend_datasource_imp/recommend_remote_datasourc_imp.dart';
import 'package:movies_app/src/repository/rcommend_repository/recommend_repository_contract.dart';

class RecommendRepositoryImp implements RecommendRepository {
  RecommendRemoteDataSource remoteDataSource;
  RecommendRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, MovieResponseDto>> getRecommend() {
    return remoteDataSource.getRecommend();
  }
}
