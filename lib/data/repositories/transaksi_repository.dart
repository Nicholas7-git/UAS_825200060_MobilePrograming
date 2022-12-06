import 'package:one_money/data/model/transaksi_model.dart';
import 'package:one_money/data/providers/transaksi_provider.dart';

class TransaksiRepository {
  final transaksiProvider = TransaksiProvider();

  Future<TransaksiModel> getTransaction({required int rekeningID}) async {
    return await transaksiProvider.getTransaction(rekeningID: rekeningID);
  }

  Future<TransaksiModel> saveTransaction({required TransaksiModel transaksiModel}) async {
    return await transaksiProvider.saveTransaction(transaksiModel: transaksiModel);
  }
}
