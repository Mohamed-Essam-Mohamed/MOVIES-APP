import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/repository/similar_repository/similar_repository_constract.dart';

part 'similar_view_model_state.dart';

class SimilarViewModelCubit extends Cubit<SimilarViewModelState> {
  SimilarViewModelCubit({required this.similarRepository})
      : super(SimilarViewModelLoading());
  SimilarRepository similarRepository;
  List<MovieDetailsResponseDto> similarMoviesList = [];
  getSimilarMovies({required int movieId}) async {
    emit(SimilarViewModelLoading());
    var either = await similarRepository.getSimilarMovies(movieId: movieId);
    either.fold(
      (error) {
        emit(SimilarViewModelError(errorMessage: error.errorMessage ?? ''));
      },
      (similarResponse) {
        similarMoviesList = similarResponse.results ?? [];
        emit(SimilarViewModelSuccess(movieResponseDto: similarResponse));
      },
    );
  }
}
