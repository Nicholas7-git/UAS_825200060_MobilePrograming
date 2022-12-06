import 'package:one_money/data/model/rekening_model.dart';
import 'package:one_money/data/providers/rekening_provider.dart';

class RekeningRepository {
  final rekeningProvider = RekeningProvider();

  Future<RekeningModel> getRekening({required String namaRekening}) async {
    return await rekeningProvider.getRekening(namaRekening: namaRekening);
  }

  Future<RekeningModel> updateRekening({required RekeningModel rekeningModel}) async {
    return await rekeningProvider.updateRekening(rekeningModel: rekeningModel);
  }
}
