part of 'populer_view_model_cubit.dart';

@immutable
abstract class PopularViewModelState {}

class PopularViewModelInitial extends PopularViewModelState {}

class PopularViewModelLoading extends PopularViewModelState {}

class PopularViewModelError extends PopularViewModelState {
  final String? errorMessage;
  PopularViewModelError({required this.errorMessage});
}

class PopularViewModelSuccess extends PopularViewModelState {
  final List<MovieDetailsResponseDto>? moviePopularList;
  PopularViewModelSuccess({required this.moviePopularList});
}
