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
    movieDetailsResponseDto = watchListDataBase.values.toList();
    emit(WatchListViewModelSuccess());
  }

  bool checkWatchListExist(int id) {
    getAllData();
    for (var element in watchListDataBase.values) {
      if (element.id == id) {
        return true;
      }
    }
    return false;
  }

  //? function to Delete object from database in hive
  void deleteOne(MovieDetailsResponseDto movieDetailsResponseDto) {
    emit(WatchListViewModelLoading());
    watchListDataBase.delete(movieDetailsResponseDto.id);
    getAllData();
    emit(WatchListViewModelSuccess());
  }

  void addToWatchList(MovieDetailsResponseDto movieDetailsResponseDto) {
    emit(WatchListViewModelLoading());
    watchListDataBase.add(movieDetailsResponseDto);
    getAllData();
    emit(WatchListViewModelSuccess());
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
