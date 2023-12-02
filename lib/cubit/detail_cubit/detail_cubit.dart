import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoku/cubit/detail_cubit/detail_state.dart';

class DetailCubit extends Cubit<DetailCubitState> {
  DetailCubit(super.initialState);

  void onFavoriteTapped() {
    emit(state.copyWith(favorite: state.favorite));
  }
}
