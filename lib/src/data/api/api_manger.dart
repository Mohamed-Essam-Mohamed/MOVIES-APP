import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/src/constants/app_api_const.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';

import '../../helper/failure.dart';
import '../model/response/movie_respons_dto.dart';

class ApiManger {
  ApiManger._();
  static ApiManger? _instance;

  static ApiManger get instance {
    _instance ??= ApiManger._();
    return _instance!;
  }

  Future<Either<Failure, MovieResponseDto>> getPopularMovies() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(apiBaseUrl, apiPopularEndPoint, {
        "api_key": apiKey,
      });
      var response = await http.get(url);

      var popularResponse =
          MovieResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        return Right(popularResponse);
      } else {
        return Left(ServerFailure(errorMessage: popularResponse.statusMessage));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }

  Future<Either<Failure, MovieResponseDto>> getReleases() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(apiBaseUrl, apiReleasesEndPoint, {
        "api_key": apiKey,
      });
      var response = await http.get(url);
      var popularResponse =
          MovieResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(popularResponse);
      } else {
        return Left(ServerFailure(errorMessage: popularResponse.statusMessage));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }

  Future<Either<Failure, MovieResponseDto>> getRecommended() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(apiBaseUrl, apiRecommendEndPoint, {
        "api_key": apiKey,
      });
      var response = await http.get(url);
      var popularResponse =
          MovieResponseDto.fromJson(await jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(popularResponse);
      } else {
        return Left(ServerFailure(errorMessage: popularResponse.statusMessage));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }

  Future<Either<Failure, MovieDetailsResponseDto>> getMovieDetails(
      {required int movieId}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.parse(
          "https://${apiBaseUrl}${apiMovieEndPoint}${movieId}?api_key=${apiKey}");

      var response = await http.get(url);
      Map<String, dynamic> jsonData = await jsonDecode(response.body);
      var detailsResponse = MovieDetailsResponseDto.fromJson(jsonData);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(detailsResponse);
      } else {
        return Left(ServerFailure(errorMessage: detailsResponse.statusMessage));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }

  Future<Either<Failure, MovieResponseDto>> getSimilarMovies(
      {required int movieId}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.parse(
          "https://${apiBaseUrl}${apiMovieEndPoint}${movieId}/similar?api_key=${apiKey}");

      var response = await http.get(url);
      var popularResponse =
          MovieResponseDto.fromJson(await jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(popularResponse);
      } else {
        return Left(ServerFailure(errorMessage: popularResponse.statusMessage));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }

  Future<Either<Failure, MovieResponseDto>> getMoviesSearchQuery(
      {required String query, required int page}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.parse(
          "https://${apiBaseUrl}${apiSearchEndpoint}?query=$query&api_key=${apiKey}&page=$page");
      var response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);
      var responseQuery = MovieResponseDto.fromJson(jsonData);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(responseQuery);
      } else {
        return Left(ServerFailure(errorMessage: responseQuery.statusMessage));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }

  Future<Either<Failure, MovieResponseDto>> getGenreId(
      {required int genreId, required int page}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.parse(
          "https://${apiBaseUrl}${apiGenreIdEndPoint}&api_key=${apiKey}&page=$page&with_genres=$genreId");

      var response = await http.get(url);
      var genreResponse = MovieResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(genreResponse);
      } else {
        return Left(ServerFailure(errorMessage: genreResponse.statusMessage));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }
}
