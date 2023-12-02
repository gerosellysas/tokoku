part of 'transaction_bloc.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionLoading extends TransactionState {}

final class TransactionLoaded extends TransactionState {
  final List<Cart> transactions;

  const TransactionLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

final class TransactionError extends TransactionState {}
