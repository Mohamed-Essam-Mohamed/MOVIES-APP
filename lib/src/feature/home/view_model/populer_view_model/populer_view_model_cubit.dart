import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/src/data/api/api_manger.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/repository/popular_repository/popular_repository_contract.dart';

part 'populer_view_model_state.dart';

class PopulerViewModelCubit extends Cubit<PopulerViewModelState> {
  PopulerViewModelCubit({required this.popularRepository})
      : super(PopulerViewModelInitial());
  PopularRepository popularRepository;
  PopulerViewModelCubit get(context) => BlocProvider.of(context);

  List<MovieDetailsResponseDto> moviePopularList = [];

  void getAllPopular() async {
    emit(PopulerViewModelLoading());
    final popular = await popularRepository.getPopularMovies();
    popular.fold(
      (l) {
        emit(PopulerViewModelError(errorMessage: l.errorMessage));
      },
      (r) {
        moviePopularList = r.results ?? [];
        emit(PopulerViewModelSuccess(moviePopularList: moviePopularList));
      },
    );
  }
}
