import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_money/config/config.dart';
import 'package:one_money/data/model/rekening_model.dart';

class RekeningProvider {
  final Dio dio = Dio();

  Future<RekeningModel> getRekening({
    required String namaRekening,
  }) async {
    try {
      // with query params
      final Response response = await dio.get(
        '${Config.baseUrl}/rekening/$namaRekening'
      );

      return RekeningModel.fromJson(response.data);
    } catch (error, stackTrace) {
      debugPrint("Exception occured: $error stackTrace: $stackTrace");
      return RekeningModel.withError("$error");
    }
  }

  Future<RekeningModel> updateRekening({
    required RekeningModel rekeningModel,
  }) async {
    try {
      // with query params
      final Response response = await dio.put(
        '${Config.baseUrl}/rekening/${rekeningModel.ID}',
        queryParameters: {
          'MerchantName': rekeningModel.MerchantName,
          'NamaRekening': rekeningModel.NamaRekening,
          'NoRekening': rekeningModel.NoRekening,
          'SaldoRekening': rekeningModel.SaldoRekening
        },
      );

      return RekeningModel.fromJson(response.data);
    } catch (error, stackTrace) {
      debugPrint("Exception occured: $error stackTrace: $stackTrace");
      return RekeningModel.withError("$error");
    }
  }
}
