import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_repo/shop_repo.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final ShopRepo shopRepo;

  TransactionBloc({required this.shopRepo}) : super(TransactionLoading()) {
    on<TransactionStarted>(_onStarted);
  }

  Future<void> _onStarted(
    TransactionStarted event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());
    try {
      final transactions = await shopRepo.loadCart();
      emit(TransactionLoaded(transactions));
    } catch (_) {
      emit(TransactionError());
    }
  }
}
