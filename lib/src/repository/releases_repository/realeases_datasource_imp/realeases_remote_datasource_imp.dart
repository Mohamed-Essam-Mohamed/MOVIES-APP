import 'package:dartz/dartz.dart';

import '../../../data/api/api_manger.dart';
import '../../../data/model/response/movie_respons_dto.dart';
import '../../../helper/failure.dart';
import '../realeases_repository_contract.dart';

class ReleaseRemoteDataSourceImp extends ReleasesRemoteDataSource {
  ApiManger apiManger;
  ReleaseRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failure, MovieResponseDto>> getReleases() async {
    var either = await apiManger.getReleases();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
}
