part of 'transfer_bloc.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class SaveTransaksi extends TransferEvent {
  final TransaksiModel transaksiModel;

  const SaveTransaksi({required this.transaksiModel});

  @override
  List<Object> get props => [transaksiModel];
}


class GetRekening extends TransferEvent {
  final String namaRekening;

  const GetRekening({required this.namaRekening});

  @override
  List<Object> get props => [namaRekening];
}