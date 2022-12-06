import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_money/data/model/rekening_model.dart';
import 'package:one_money/data/model/top_headlines.dart';
import 'package:one_money/data/model/transaksi_model.dart';
import 'package:one_money/data/repositories/news_repository.dart';
import 'package:one_money/data/repositories/rekening_repository.dart';
import 'package:one_money/data/repositories/transaksi_repository.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    final TransaksiRepository transaksiRepository = TransaksiRepository();
    final RekeningRepository rekeningRepository = RekeningRepository();

    on<TransferEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SaveTransaksi>((event, emit) async {
      emit(TransaksiSaveing());
      try {
        final TransaksiModel transaksiModel =
            await transaksiRepository.saveTransaction(transaksiModel: event.transaksiModel);
        emit(TransaksiSaved(transaksiModel: transaksiModel));
      } catch (error) {
        emit(TransaksiError(message: error.toString()));
      }
    });

    on<GetRekening>((event, emit) async {
      emit(RekeningLoading());
      try {
        final RekeningModel rekeningModel =
            await rekeningRepository.getRekening(namaRekening: event.namaRekening);
        emit(RekeningLoaded(rekeningModel: rekeningModel));
      } catch (error) {
        emit(TransaksiError(message: error.toString()));
      }
    });
  }
}
