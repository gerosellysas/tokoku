import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoku/cubit/obscure_pwd_cubit/obscure_pwd_state.dart';

class ObscurePwdCubit extends Cubit<ObscurePwdCubitState> {
  ObscurePwdCubit(super.initialState);

  void onObscureTapped() {
    emit(state.copyWith(obscure: !state.obscure));
  }
}
