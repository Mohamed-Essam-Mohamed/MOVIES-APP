part of 'home_view_model_cubit.dart';

@immutable
abstract class HomeViewModelState {}

class HomeViewModelInitial extends HomeViewModelState {}

class HomeViewModelLoading extends HomeViewModelState {}

class HomeViewModelError extends HomeViewModelState {
  final String? errorMessage;
  HomeViewModelError({required this.errorMessage});
}

class HomeViewModelSuccess extends HomeViewModelState {
  final List<MovieDetailsResponseDto>? moviePopularList;
  HomeViewModelSuccess({required this.moviePopularList});
}
