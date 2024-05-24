part of 'populer_view_model_cubit.dart';

@immutable
abstract class PopulerViewModelState {}

class PopulerViewModelInitial extends PopulerViewModelState {}

class PopulerViewModelLoading extends PopulerViewModelState {}

class PopulerViewModelError extends PopulerViewModelState {
  final String? errorMessage;
  PopulerViewModelError({required this.errorMessage});
}

class PopulerViewModelSuccess extends PopulerViewModelState {
  final List<MovieDetailsResponseDto>? moviePopularList;
  PopulerViewModelSuccess({required this.moviePopularList});
}
