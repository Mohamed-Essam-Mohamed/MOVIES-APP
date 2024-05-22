import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/src/constants/app_api_const.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/helper/failure.dart';
import 'package:http/http.dart' as http;

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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(popularResponse);
      } else {
        return Left(ServerFailure(errorMessage: popularResponse.statusMessage));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }
}
