import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../data/model/response/movie_details_respons_dto.dart';
import '../../../../repository/rcommend_repository/recommend_repository_contract.dart';

part 'recommended_view_model_state.dart';

class RecommendedViewModelCubit extends Cubit<RecommendedViewModelState> {
  RecommendedViewModelCubit({required this.recommendRepository})
      : super(RecommendedViewModelInitial());
  RecommendRepository recommendRepository;
  List<MovieDetailsResponseDto> movieRecommendList = [];
  getRecommend() async {
    emit(RecommendedViewModelLoading());
    final result = await recommendRepository.getRecommend();
    result.fold(
      (error) {
        emit(RecommendedViewModelError(errorMessage: error.errorMessage ?? ""));
      },
      (responseRecommend) {
        movieRecommendList = responseRecommend.results ?? [];
        emit(RecommendedViewModelSuccess(
            movieDetailsResponseDto: responseRecommend.results ?? []));
      },
    );
  }
}
