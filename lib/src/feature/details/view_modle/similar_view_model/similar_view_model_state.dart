part of 'similar_view_model_cubit.dart';

@immutable
abstract class SimilarViewModelState {}

class SimilarViewModelSuccess extends SimilarViewModelState {
  final MovieResponseDto movieResponseDto;
  SimilarViewModelSuccess({required this.movieResponseDto});
}

class SimilarViewModelError extends SimilarViewModelState {
  final String errorMessage;
  SimilarViewModelError({required this.errorMessage});
}

class SimilarViewModelLoading extends SimilarViewModelState {}
