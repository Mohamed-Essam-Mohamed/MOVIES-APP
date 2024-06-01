import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'watch_list_view_model_state.dart';

class WatchListViewModelCubit extends Cubit<WatchListViewModelState> {
  WatchListViewModelCubit() : super(WatchListViewModelInitial());

  
}
