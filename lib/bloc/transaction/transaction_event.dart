part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();
}

final class TransactionStarted extends TransactionEvent {
  @override
  List<Object> get props => [];
}
