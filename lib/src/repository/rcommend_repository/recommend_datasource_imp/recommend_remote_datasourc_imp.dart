import 'package:dartz/dartz.dart';
import '../../../data/api/api_manger.dart';
import '../../../data/model/response/movie_respons_dto.dart';
import '../../../helper/failure.dart';
import '../recommend_repository_contract.dart';

class RecommendRemoteDataSourceImp extends RecommendRemoteDataSource {
  ApiManger apiManger;

  RecommendRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failure, MovieResponseDto>> getRecommend() async {
    var either = await apiManger.getRecommended();
    return either.fold(
        (l) => Left(Failure(errorMessage: l.errorMessage)), (r) => Right(r));
  }
}
