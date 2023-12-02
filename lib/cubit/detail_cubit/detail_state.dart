class DetailCubitState {
  final bool favorite;
  DetailCubitState({this.favorite = false});
  DetailCubitState copyWith({
    bool? favorite,
  }) {
    return DetailCubitState(
      favorite: favorite ?? this.favorite,
    );
  }
}

