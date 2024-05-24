import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/src/data/api/api_manger.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/repository/popular_repository/popular_repository_contract.dart';

part 'home_view_model_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit({required this.popularRepository})
      : super(HomeViewModelInitial());
  PopularRepository popularRepository;
  HomeViewModelCubit get(context) => BlocProvider.of(context);

  List<MovieDetailsResponseDto> moviePopularList = [];

  void getAllPopular() async {
    emit(HomeViewModelLoading());
    final popular = await popularRepository.getPopularMovies();
    popular.fold(
      (l) {
        emit(HomeViewModelError(errorMessage: l.errorMessage));
      },
      (r) {
        moviePopularList = r.results ?? [];
        emit(HomeViewModelSuccess(moviePopularList: moviePopularList));
      },
    );
  }
}
