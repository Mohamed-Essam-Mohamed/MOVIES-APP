import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';

import '../../../constants/hive_const.dart';

part 'watch_list_view_model_state.dart';

class WatchListViewModelCubit extends Cubit<WatchListViewModelState> {
  WatchListViewModelCubit() : super(WatchListViewModelInitial());
  static WatchListViewModelCubit get(context) => BlocProvider.of(context);

  List<MovieDetailsResponseDto> movieDetailsResponseDto = [];
  var watchListDataBase =
      Hive.box<MovieDetailsResponseDto>(HiveConst.moviesWatchList);
  //? function to get all data in hive
  void getAllData() {
    emit(WatchListViewModelLoading());
    for (var element in watchListDataBase.values) {
      movieDetailsResponseDto.add(element);
    }
    emit(WatchListViewModelInitial());
  }

  bool checkWatchListExist(int id) {
    for (var element in watchListDataBase.values) {
      if (element.id == id) {
        return true;
      }
    }
    return false;
  }

  void removeFromWatchList(MoviesWatchListDataBase movieDetailsResponseDto) {
    emit(WatchListViewModelLoading());
    watchListDataBase.delete(movieDetailsResponseDto);
    emit(WatchListViewModelInitial());
  }

  void addToWatchList(MoviesWatchListDataBase movieDetailsResponseDto) {
    emit(WatchListViewModelLoading());
    watchListDataBase.add(movieDetailsResponseDto);
    emit(WatchListViewModelInitial());
  }
}

class MoviesWatchListDataBase extends MovieDetailsResponseDto {
  MoviesWatchListDataBase({
    required super.id,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
  });
}
