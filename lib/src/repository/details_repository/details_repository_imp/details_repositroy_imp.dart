import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/details_repository/details_repository_contract.dart';

class DetailsRepositoryImp implements DetailsRepository {
  DetailsRemoteDataSource dataSource;
  DetailsRepositoryImp({required this.dataSource});

  @override
  Future<Either<Failure, MovieDetailsResponseDto>> getDetailsMovies(
      {required int movieId}) async {
    return await dataSource.getDetailsMovies(movieId: movieId);
  }
}
