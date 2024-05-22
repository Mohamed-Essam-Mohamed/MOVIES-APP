import 'package:dartz/dartz.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:movies_app/src/repository/repository_popular_movies/popular_remote_datasource_imp/popular_remote_datasource_imp.dart';
import 'package:movies_app/src/repository/repository_popular_movies/popular_repository_contract.dart';

class PopularRepositoryImp implements PopularRepository {
  final PopularRemoteDataSource popularRemoteDataSource;
  PopularRepositoryImp(this.popularRemoteDataSource);

  @override
  Future<Either<Failure, MovieResponseDto>> getPopularMovies() async {
    return await popularRemoteDataSource.getPopularMovies();
  }
}

PopularRepository injectPopularRepository() {
  return PopularRepositoryImp(injectPopularRemoteDataSource());
}
