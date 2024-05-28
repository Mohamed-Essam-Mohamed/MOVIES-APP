import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/similar_repository/similar_repository_constract.dart';

class SimilarRepositoryImp implements SimilarRepository {
  SimilarRemoteDataSource remoteDataSource;
  SimilarRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, MovieResponseDto>> getSimilarMovies(
      {required int movieId}) {
    return remoteDataSource.getSimilarMovies(movieId: movieId);
  }
}
