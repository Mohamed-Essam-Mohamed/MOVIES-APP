part of 'details_view_model_cubit.dart';

@immutable
abstract class DetailsViewModelState {}

class DetailsViewModelInitial extends DetailsViewModelState {}

class DetailsViewModelLoading extends DetailsViewModelState {}

class DetailsViewModelSuccess extends DetailsViewModelState {
  final MovieDetailsResponseDto movieDetailsResponseDto;
  DetailsViewModelSuccess({required this.movieDetailsResponseDto});
}

class DetailsViewModelError extends DetailsViewModelState {
  final String errorMessage;
  DetailsViewModelError({required this.errorMessage});
}
