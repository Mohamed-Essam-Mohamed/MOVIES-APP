import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'browse_view_model_state.dart';

class BrowseViewModelCubit extends Cubit<BrowseViewModelState> {
  BrowseViewModelCubit() : super(BrowseViewModelInitial());

  
}
