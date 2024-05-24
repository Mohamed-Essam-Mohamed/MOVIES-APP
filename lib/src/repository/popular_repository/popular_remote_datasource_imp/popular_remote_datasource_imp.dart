import 'package:dartz/dartz.dart';

import '../../../data/api/api_manger.dart';
import '../../../data/model/response/movie_respons_dto.dart';
import '../../../helper/failure.dart';
import '../popular_repository_contract.dart';

class PopularRemoteDataSourceImp implements PopularRemoteDataSource {
  ApiManger apiManger;
  PopularRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failure, MovieResponseDto>> getPopularMovies() async {
    var either = await apiManger.getPopularMovies();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
}
