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
  getSearchMovies({required String query}) async {
    emit(SearchViewModelLoading());
    var either =
        await searchRepository.getMoviesSearchQuery(query: query, page: 1);

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
          emit(SearchViewModelSuccess(moviesList: response.results));
        }
      },
    );
  }
}
