import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/repository/search_repository/search_repository_contract.dart';

part 'search_view_model_state.dart';

class SearchViewModelCubit extends Cubit<SearchViewModelState> {
  SearchViewModelCubit({required this.searchRepository})
      : super(SearchViewModelInitial());
  SearchRepository searchRepository;
  List<MovieDetailsResponseDto>? moviesList = [];
  List<MovieDetailsResponseDto>? moviesListClear = [];

  int page = 1;

  getSearchMovies({required String query}) async {
    emit(SearchViewModelLoading());
    var either =
        await searchRepository.getMoviesSearchQuery(query: query, page: page);

    either.fold(
      (error) {
        emit(SearchViewModelFailure(errorMessage: error.errorMessage ?? ''));
      },
      (response) {
        if (response.statusCode != null) {
          emit(SearchViewModelFailure(errorMessage: response.statusMessage!));
        } else if (response.totalResults == 0) {
          emit(SearchViewModelEmpty());
        } else {
          moviesList = response.results ?? [];
          // clear null  poster path
          moviesListClear = moviesList
              ?.where((element) => element.posterPath != null)
              .toList();

          emit(SearchViewModelSuccess(moviesList: response.results));
        }
      },
    );
  }
}
