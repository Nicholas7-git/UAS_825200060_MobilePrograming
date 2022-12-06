part of 'transfer_bloc.dart';

abstract class TransferState extends Equatable {
  const TransferState();

  @override
  List<Object> get props => [];
}

class TransferInitial extends TransferState {}

class TransaksiSaveing extends TransferState {}

class RekeningLoading extends TransferState {}

class TransaksiSaved extends TransferState {
  final TransaksiModel transaksiModel;

  const TransaksiSaved({required this.transaksiModel});

  @override
  List<Object> get props => [transaksiModel];
}

class RekeningLoaded extends TransferState {
  final RekeningModel rekeningModel;

  const RekeningLoaded({required this.rekeningModel});

  @override
  List<Object> get props => [rekeningModel];
}

class TransaksiError extends TransferState {
  final String message;

  const TransaksiError({required this.message});

  @override
  List<Object> get props => [message];
}
