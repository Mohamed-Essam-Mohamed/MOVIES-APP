part of 'browse_view_model_cubit.dart';

@immutable
abstract class BrowseViewModelState {}

class BrowseViewModelInitial extends BrowseViewModelState {}

class BrowseViewModelLoading extends BrowseViewModelState {}

class BrowseViewModelSuccess extends BrowseViewModelState {
  final List<MovieDetailsResponseDto>? moviesList;

  BrowseViewModelSuccess({required this.moviesList});
}

class BrowseViewModelError extends BrowseViewModelState {
  final String messageError;

  BrowseViewModelError({required this.messageError});
}
