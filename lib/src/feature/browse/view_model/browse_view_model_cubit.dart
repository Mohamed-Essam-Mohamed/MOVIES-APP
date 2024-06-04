import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/repository/browse_repository/browse_repository_contract.dart';

part 'browse_view_model_state.dart';

class BrowseViewModelCubit extends Cubit<BrowseViewModelState> {
  BrowseViewModelCubit({
    required this.browseRepository,
  }) : super(BrowseViewModelInitial());
  BrowseRepository browseRepository;
  List<MovieDetailsResponseDto>? moviesBrowseList = [];
  List<MovieDetailsResponseDto>? moviesListClear = [];
  getBrowsItems({required int genreId, int page = 1}) async {
    emit(BrowseViewModelLoading());
    final browse =
        await browseRepository.getGenreId(genreId: genreId, page: page);
    browse.fold((error) {
      emit(BrowseViewModelError(messageError: error.errorMessage ?? ''));
    }, (response) {
      moviesBrowseList = response.results ?? [];
      moviesListClear = moviesBrowseList
          ?.where((element) => element.posterPath != null)
          .toList();

      emit(BrowseViewModelSuccess(moviesList: response.results ?? []));
    });
  }
}
