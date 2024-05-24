part of 'releases_view_model_cubit.dart';

@immutable
abstract class ReleasesViewModelState {}

class ReleasesViewModelInitial extends ReleasesViewModelState {}

class ReleasesViewModelLoading extends ReleasesViewModelState {}

class ReleasesViewModelSuccess extends ReleasesViewModelState {
  final List<MovieDetailsResponseDto> releases;
  ReleasesViewModelSuccess({required this.releases});
}

class ReleasesViewModelError extends ReleasesViewModelState {
  final String? messageErorr;
  ReleasesViewModelError({required this.messageErorr});
}
