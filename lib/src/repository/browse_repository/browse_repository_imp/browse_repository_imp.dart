import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/browse_repository/browse_repository_contract.dart';

class BrowseRepositoryImp implements BrowseRepository {
  BrowseRemoteDataSource browseRemoteDataSource;
  BrowseRepositoryImp({required this.browseRemoteDataSource});
  @override
  Future<Either<Failure, MovieResponseDto>> getGenreId(
      {required int genreId, required int page}) {
    return browseRemoteDataSource.getGenreId(genreId: genreId, page: page);
  }
}
