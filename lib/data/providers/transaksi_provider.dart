import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_money/config/config.dart';
import 'package:one_money/data/model/transaksi_model.dart';

class TransaksiProvider {
  final Dio dio = Dio();

  Future<TransaksiModel> saveTransaction({required TransaksiModel transaksiModel}) async {
    try {
      // with query params
      final Response response = await dio.post(
        '${Config.baseUrl}/transaksi',
        queryParameters: {
          'FromRekeningID': transaksiModel.FormRekeningID,
          'TORekeningID': transaksiModel.TORekeningID,
          'NominalTransaksi': transaksiModel.NominalTransaksi,
          'TitleTransaksi': transaksiModel.TitleTransaksi,
          'RemarksTransaksi': transaksiModel.RemarksTransaksi,
        },
      );

      return TransaksiModel.fromJson(response.data);
    } catch (error, stackTrace) {
      debugPrint("Exception occured: $error stackTrace: $stackTrace");
      return TransaksiModel.withError("$error");
    }
  }

  Future<TransaksiModel> getTransaction({
    required int rekeningID,
  }) async {
    try {
      // with query params
      final Response response = await dio.get(
        '${Config.baseUrl}/transaksi/$rekeningID'
      );

      return TransaksiModel.fromJson(response.data);
    } catch (error, stackTrace) {
      debugPrint("Exception occured: $error stackTrace: $stackTrace");
      return TransaksiModel.withError("$error");
    }
  }
}
