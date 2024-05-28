import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/data/model/response/movie_respons_dto.dart';
import 'package:movies_app/src/repository/details_repository/details_repository_contract.dart';

part 'details_view_model_state.dart';

class DetailsViewModelCubit extends Cubit<DetailsViewModelState> {
  DetailsViewModelCubit({required this.detailsRepository})
      : super(DetailsViewModelInitial());
  DetailsRepository detailsRepository;

  getDetailsMovies({required int movieId}) async {
    emit(DetailsViewModelLoading());
    var either = await detailsRepository.getDetailsMovies(movieId: movieId);
    either.fold(
      (error) {
        emit(DetailsViewModelError(errorMessage: error.errorMessage ?? ''));
      },
      (detailsResponse) {
        emit(DetailsViewModelSuccess(movieDetailsResponseDto: detailsResponse));
      },
    );
  }
}
