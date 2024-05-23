import 'package:movies_app/src/data/api/api_manger.dart';
import 'package:movies_app/src/repository/popular_repository/popular_remote_datasource_imp/popular_remote_datasource_imp.dart';
import 'package:movies_app/src/repository/popular_repository/popular_repository_contract.dart';
import 'package:movies_app/src/repository/popular_repository/popular_repository_imp/popular_repository_imp.dart';
import 'package:movies_app/src/repository/rcommend_repository/recommend_datasource_imp/recommend_remote_datasourc_imp.dart';
import 'package:movies_app/src/repository/rcommend_repository/recommend_repository_contract.dart';
import 'package:movies_app/src/repository/rcommend_repository/recommend_repository_imp/recommend_repository_imp.dart';
import 'package:movies_app/src/repository/releases_repository/realease_repository_imp/release_repository_imp.dart';
import 'package:movies_app/src/repository/releases_repository/realeases_datasource_imp/realeases_remote_datasource_imp.dart';
import 'package:movies_app/src/repository/releases_repository/realeases_repository_contract.dart';
//? popular dependency injection

PopularRemoteDataSource injectPopularRemoteDataSource() {
  return PopularRemoteDataSourceImp(apiManger: ApiManger.instance);
}

PopularRepository injectPopularRepository() {
  return PopularRepositoryImp(injectPopularRemoteDataSource());
}

//? Recommend dependency injection
RecommendRemoteDataSource injectRecommendRemoteDataSource() {
  return RecommendRemoteDataSourceImp(apiManger: ApiManger.instance);
}

RecommendRepository injectRecommendRepository() {
  return RecommendRepositoryImp(
      remoteDataSource: injectRecommendRemoteDataSource());
}

//? Releases dependency injection
ReleasesRemoteDataSource injectReleaseRemoteDataSource() {
  return ReleaseRemoteDataSourceImp(apiManger: ApiManger.instance);
}

ReleaseRepository injectReleaseRepository() {
  return ReleaseRepositoryImp(
      releasesRemoteDataSource: injectReleaseRemoteDataSource());
}

//?


