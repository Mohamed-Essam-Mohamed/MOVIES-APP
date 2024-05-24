import 'package:dartz/dartz.dart';
import '../../../data/model/response/movie_respons_dto.dart';
import '../../../helper/failure.dart';
import '../realeases_repository_contract.dart';

class ReleaseRepositoryImp extends ReleaseRepository {
  ReleasesRemoteDataSource releasesRemoteDataSource;

  ReleaseRepositoryImp({required this.releasesRemoteDataSource});
  @override
  Future<Either<Failure, MovieResponseDto>> getReleases() {
    return releasesRemoteDataSource.getReleases();
  }
}
