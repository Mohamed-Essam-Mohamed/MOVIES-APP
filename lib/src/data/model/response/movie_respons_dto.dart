import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';

class MovieResponseDto {
  MovieResponseDto({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  MovieResponseDto.fromJson(dynamic json) {
    page = json['page'];

    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieDetailsResponseDto.fromJson(v));
      });
    }

    totalPages = json['total_pages'];

    totalResults = json['total_results'];

    statusCode = json["status_code"];
    statusMessage = json["status_message"];

    success = json["success"];
  }
  int? page;
  List<MovieDetailsResponseDto>? results;
  int? totalPages;
  int? totalResults;
  int? statusCode;
  String? statusMessage;
  bool? success;
}
