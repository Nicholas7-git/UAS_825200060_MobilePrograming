class RekeningModel {
  RekeningModel({
    required this.ID,
    required this.MerchantName,
    required this.NoRekening,
    required this.NamaRekening,
    required this.SaldoRekening,
  });
  late final int ID;
  late final String MerchantName;
  late final String NoRekening;
  late final String NamaRekening;
  late final String SaldoRekening;
  String? error;

  RekeningModel.withError(String s) {
    error = s;
  }

  RekeningModel.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    MerchantName = json['MerchantName'];
    NoRekening = json['NoRekening'];
    NamaRekening = json['NamaRekening'];
    SaldoRekening = json['SaldoRekening'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ID'] = ID;
    data['MerchantName'] = MerchantName;
    data['NoRekening'] = NoRekening;
    data['NamaRekening'] = NamaRekening;
    data['SaldoRekening'] = SaldoRekening;
    return data;
  }
}
