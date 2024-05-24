import 'package:dartz/dartz.dart';
import '../../../data/model/response/movie_respons_dto.dart';
import '../../../helper/failure.dart';
import '../popular_repository_contract.dart';

class PopularRepositoryImp implements PopularRepository {
  PopularRemoteDataSource popularRemoteDataSource;
  PopularRepositoryImp(this.popularRemoteDataSource);

  @override
  Future<Either<Failure, MovieResponseDto>> getPopularMovies() async {
    return await popularRemoteDataSource.getPopularMovies();
  }
}
