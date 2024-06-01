import 'package:movies_app/src/repository/details_repository/details_datasource_imp/details_remote_datasource_imp.dart';
import 'package:movies_app/src/repository/details_repository/details_repository_contract.dart';
import 'package:movies_app/src/repository/details_repository/details_repository_imp/details_repositroy_imp.dart';
import 'package:movies_app/src/repository/search_repository/search_datasource_imp/search_remote_dataource_imp.dart';
import 'package:movies_app/src/repository/search_repository/search_repository_contract.dart';
import 'package:movies_app/src/repository/search_repository/search_repository_imp/search_repository_imp.dart';
import 'package:movies_app/src/repository/similar_repository/similar_datasource_imp/similar_remote_datasource_imp.dart';
import 'package:movies_app/src/repository/similar_repository/similar_repository_constract.dart';
import 'package:movies_app/src/repository/similar_repository/similar_repository_imp/similar_repository_imp.dart';

import '../data/api/api_manger.dart';
import '../repository/popular_repository/popular_remote_datasource_imp/popular_remote_datasource_imp.dart';
import '../repository/popular_repository/popular_repository_contract.dart';
import '../repository/popular_repository/popular_repository_imp/popular_repository_imp.dart';
import '../repository/rcommend_repository/recommend_datasource_imp/recommend_remote_datasourc_imp.dart';
import '../repository/rcommend_repository/recommend_repository_contract.dart';
import '../repository/rcommend_repository/recommend_repository_imp/recommend_repository_imp.dart';
import '../repository/releases_repository/realease_repository_imp/release_repository_imp.dart';
import '../repository/releases_repository/realeases_datasource_imp/realeases_remote_datasource_imp.dart';
import '../repository/releases_repository/realeases_repository_contract.dart';
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

//? similar dependency injection
SimilarRemoteDataSource injectSimilarRemoteDataSource() {
  return SimilarRemoteDatasourceImp(apiManger: ApiManger.instance);
}

SimilarRepository injectSimilarRepository() {
  return SimilarRepositoryImp(
      remoteDataSource: injectSimilarRemoteDataSource());
}

//? Details dependency injection
DetailsRemoteDataSource inijectDetailsRemoteDataSource() {
  return DetailsRemoteDataSourceImp(apiManger: ApiManger.instance);
}

DetailsRepository injectDetailsRepository() {
  return DetailsRepositoryImp(dataSource: inijectDetailsRemoteDataSource());
}

//? Search dependency injection
SearchRepository injectSearchRepository() {
  return SearchRepositoryImp(remoteDataSource: injectSearchRemoteDataSource());
}

SearchRemoteDataSource injectSearchRemoteDataSource() =>
    SearchRemoteDataSourceImp(apiManger: ApiManger.instance);
//? 