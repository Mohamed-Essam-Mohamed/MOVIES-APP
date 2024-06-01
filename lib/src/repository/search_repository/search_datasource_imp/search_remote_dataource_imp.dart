import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/api/api_manger.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/search_repository/search_repository_contract.dart';

class SearchRemoteDataSourceImp implements SearchRemoteDataSource {
  ApiManger apiManger;

  SearchRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failure, MovieResponseDto>> getMoviesSearchQuery(
      {required String query, required int page}) async {
    var either = await apiManger.getMoviesSearchQuery(query: query, page: page);
    return either.fold(
        (l) => Left(Failure(errorMessage: l.errorMessage)), (r) => Right(r));
  }
}
