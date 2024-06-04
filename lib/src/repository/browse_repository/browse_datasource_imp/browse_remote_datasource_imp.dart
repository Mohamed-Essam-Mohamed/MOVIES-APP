import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/api/api_manger.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/browse_repository/browse_repository_contract.dart';

class BrowseRemoteDataSourceImp implements BrowseRemoteDataSource {
  ApiManger apiManger;

  BrowseRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failure, MovieResponseDto>> getGenreId(
      {required int genreId, required int page}) async {
    var either = await apiManger.getGenreId(genreId: genreId, page: page);
    return either.fold((error) {
      return Left(Failure(errorMessage: error.errorMessage));
    }, (genreIdResponse) {
      return Right(genreIdResponse);
    });
  }
}
