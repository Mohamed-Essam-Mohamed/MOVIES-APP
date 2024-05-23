import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/api/api_manger.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/popular_repository/popular_repository_contract.dart';

class PopularRemoteDataSourceImp implements PopularRemoteDataSource {
  ApiManger apiManger;
  PopularRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failure, MovieResponseDto>> getPopularMovies() async {
    return await apiManger.getPopularMovies();
  }
}
