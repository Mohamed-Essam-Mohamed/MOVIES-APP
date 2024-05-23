import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/releases_repository/realeases_repository_contract.dart';

class ReleaseRepositoryImp extends ReleaseRepository {
  ReleasesRemoteDataSource releasesRemoteDataSource;

  ReleaseRepositoryImp({required this.releasesRemoteDataSource});
  @override
  Future<Either<Failure, MovieResponseDto>> getReleases() {
    return releasesRemoteDataSource.getReleases();
  }
}
