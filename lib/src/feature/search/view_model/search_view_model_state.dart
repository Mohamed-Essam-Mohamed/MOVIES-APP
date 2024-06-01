part of 'search_view_model_cubit.dart';

@immutable
abstract class SearchViewModelState {}

class SearchViewModelInitial extends SearchViewModelState {}

final class SearchViewModelLoading extends SearchViewModelState {}

final class SearchViewModelEmpty extends SearchViewModelState {}

final class SearchViewModelSuccess extends SearchViewModelState {
  final List<MovieDetailsResponseDto>? moviesList;

  SearchViewModelSuccess({required this.moviesList});
}

final class SearchViewModelFailure extends SearchViewModelState {
  final String errorMessage;

  SearchViewModelFailure({required this.errorMessage});
}
