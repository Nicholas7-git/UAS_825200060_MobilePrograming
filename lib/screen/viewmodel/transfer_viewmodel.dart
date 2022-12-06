import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_money/data/model/transaksi_model.dart';
import 'package:one_money/data/repositories/rekening_repository.dart';

import '../../data/repositories/transaksi_repository.dart';

class TransferViewModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  Future<String> saveTransaksi(TransaksiModel transaksiModel) async {
    String hasil = 'Berhasil Melakukan Transfer';
    TransaksiRepository transaksiRepository = TransaksiRepository();
    var saveTransaksi = await transaksiRepository.saveTransaction(transaksiModel: transaksiModel);
    if(saveTransaksi.error != null){
      hasil = 'Gagal Melakukan Transfer';
    }
    return hasil;
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}