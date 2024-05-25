import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/details_repository/details_repository_contract.dart';

class DetailsRepositroyImp implements DetailsRepository {
  DetailsRemoteDataSource dataSource;
  DetailsRepositroyImp({required this.dataSource});

  @override
  Future<Either<Failure, MovieResponseDto>> getDetailsMovies(
      {required int movieId}) async {
    return await dataSource.getDetailsMovies(movieId: movieId);
  }
}
