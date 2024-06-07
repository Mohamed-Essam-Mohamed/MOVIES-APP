import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../data/model/response/movie_details_respons_dto.dart';
import '../../../../repository/popular_repository/popular_repository_contract.dart';

part 'populer_view_model_state.dart';

class PopularViewModelCubit extends Cubit<PopularViewModelState> {
  PopularViewModelCubit({required this.popularRepository})
      : super(PopularViewModelInitial());
  PopularRepository popularRepository;
  PopularViewModelCubit get(context) => BlocProvider.of(context);

  List<MovieDetailsResponseDto> moviePopularList = [];

  void getAllPopular() async {
    emit(PopularViewModelLoading());
    final popular = await popularRepository.getPopularMovies();
    popular.fold(
      (l) {
        emit(PopularViewModelError(errorMessage: l.errorMessage));
      },
      (r) {
        moviePopularList = r.results ?? [];
        emit(PopularViewModelSuccess(moviePopularList: moviePopularList));
      },
    );
  }
}
