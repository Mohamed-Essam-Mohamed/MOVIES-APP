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
  var moviesDataBase =
      Hive.box<MovieDetailsResponseDto>(HiveConst.moviesWatchList);
  //? function to get all data in hive
  void getAllData() {
    emit(WatchListViewModelLoading());
    movieDetailsResponseDto = moviesDataBase.values.toList();
    emit(WatchListViewModelSuccess());
  }

  //? chaeck list is empty or not
  void checkListEmpty() {
    if (movieDetailsResponseDto.isEmpty) {
      emit(WatchListViewModelEmpty());
    } else {
      emit(WatchListViewModelSuccess());
    }
  }

  deleteOrAddWatchList(
      int id, MovieDetailsResponseDto movieDetailsResponseDto) async {
    if (moviesDataBase.keys.contains(id)) {
      await deleteFromWatchList(id);
      emit(WatchListViewModelSuccess());
    } else {
      await addToWatchList(id, movieDetailsResponseDto);
      emit(WatchListViewModelSuccess());
    }
  }

  Future<void> addToWatchList(
      int id, MovieDetailsResponseDto movieDetailsResponseDto) async {
    await moviesDataBase.put(id, movieDetailsResponseDto);
    getAllData();
  }

  Future<void> deleteFromWatchList(int id) async {
    await moviesDataBase.delete(id);
    getAllData();
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
