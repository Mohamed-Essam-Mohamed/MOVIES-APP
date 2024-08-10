part of 'watch_list_view_model_cubit.dart';

@immutable
abstract class WatchListViewModelState {}

class WatchListViewModelInitial extends WatchListViewModelState {}

class WatchListViewModelLoading extends WatchListViewModelState {}

class WatchListViewModelSuccess extends WatchListViewModelState {}

class WatchListViewModelError extends WatchListViewModelState {}

class WatchListViewModelEmpty extends WatchListViewModelState {}
