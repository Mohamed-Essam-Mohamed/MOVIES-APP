part of 'recommended_view_model_cubit.dart';

@immutable
abstract class RecommendedViewModelState {}

class RecommendedViewModelInitial extends RecommendedViewModelState {}

class RecommendedViewModelLoading extends RecommendedViewModelState {}

class RecommendedViewModelSuccess extends RecommendedViewModelState {
  final List<MovieDetailsResponseDto> movieDetailsResponseDto;
  RecommendedViewModelSuccess({required this.movieDetailsResponseDto});
}

class RecommendedViewModelError extends RecommendedViewModelState {
  final String errorMessage;
  RecommendedViewModelError({required this.errorMessage});
}
