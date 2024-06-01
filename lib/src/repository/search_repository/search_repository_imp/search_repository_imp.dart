import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/search_repository/search_repository_contract.dart';

class SearchRepositoryImp implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;
  SearchRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, MovieResponseDto>> getMoviesSearchQuery(
      {required String query, required int page}) {
    return remoteDataSource.getMoviesSearchQuery(query: query, page: page);
  }
}
