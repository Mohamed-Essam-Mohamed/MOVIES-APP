import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/api/api_manger.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/similar_repository/similar_repository_constract.dart';

class SimilarRemoteDatasourceImp implements SimilarRemoteDataSource {
  ApiManger apiManger;

  SimilarRemoteDatasourceImp({required this.apiManger});
  @override
  Future<Either<Failure, MovieResponseDto>> getSimilarMovies(
      {required int movieId}) async {
    var either = await apiManger.getSimilarMovies(movieId: movieId);
    return either.fold((error) {
      return Left(Failure(errorMessage: error.errorMessage));
    }, (similarResponse) {
      return Right(similarResponse);
    });
  }
}
