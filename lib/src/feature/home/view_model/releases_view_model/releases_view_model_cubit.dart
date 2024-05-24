import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';

import 'package:meta/meta.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/repository/releases_repository/realeases_repository_contract.dart';

part 'releases_view_model_state.dart';

class ReleasesViewModelCubit extends Cubit<ReleasesViewModelState> {
  ReleasesViewModelCubit({
    required this.releaseRepository,
  }) : super(ReleasesViewModelInitial());
  ReleaseRepository releaseRepository;
  List<MovieDetailsResponseDto> movieReleaseList = [];

  getReleases() async {
    var eihter = await releaseRepository.getReleases();
    emit(ReleasesViewModelLoading());
    eihter.fold(
      (error) {
        emit(ReleasesViewModelError(messageErorr: error.errorMessage));
      },
      (responseRelease) {
        movieReleaseList = responseRelease.results ?? [];
        emit(ReleasesViewModelSuccess(releases: responseRelease.results ?? []));
      },
    );
  }
}
