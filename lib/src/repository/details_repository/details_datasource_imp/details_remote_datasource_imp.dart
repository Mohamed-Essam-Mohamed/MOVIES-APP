import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/api/api_manger.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/details_repository/details_repository_contract.dart';

class DetailsRemoteDatasourceImp implements DetailsRemoteDataSource {
  ApiManger apiManger;
  DetailsRemoteDatasourceImp({required this.apiManger});
  @override
  Future<Either<Failure, MovieResponseDto>> getDetailsMovies(
      {required int movieId}) async {
    var either = await apiManger.getMovieDetails(movieId: movieId);
    return either.fold((error) {
      return Left(Failure(errorMessage: error.errorMessage));
    }, (detailsResponse) {
      return Right(detailsResponse);
    });
  }
}

DetailsRemoteDataSource inijectDetailsRemoteDataSource() {
  return DetailsRemoteDatasourceImp(apiManger: ApiManger.instance);
}
