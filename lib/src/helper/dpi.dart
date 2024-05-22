//? popular dependency injection
import 'package:movies_app/src/data/api/api_manger.dart';
import 'package:movies_app/src/repository/repository_popular_movies/popular_remote_datasource_imp/popular_remote_datasource_imp.dart';
import 'package:movies_app/src/repository/repository_popular_movies/popular_repository_contract.dart';
import 'package:movies_app/src/repository/repository_popular_movies/popular_repository_imp/popular_repository_imp.dart';

PopularRemoteDataSource injectPopularRemoteDataSource() {
  return PopularRemoteDataSourceImp(apiManger: ApiManger.instance);
}

PopularRepository injectPopularRepository() {
  return PopularRepositoryImp(injectPopularRemoteDataSource());
}
