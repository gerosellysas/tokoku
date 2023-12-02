class ObscurePwdCubitState {
  final bool obscure;
  ObscurePwdCubitState({this.obscure = true});
  ObscurePwdCubitState copyWith({
    bool? obscure,
  }) {
    return ObscurePwdCubitState(
      obscure: obscure ?? this.obscure,
    );
  }
}
