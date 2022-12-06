class TransaksiModel {
  TransaksiModel({
    required this.FormRekeningID,
    required this.TORekeningID,
    required this.NominalTransaksi,
    required this.TitleTransaksi,
    required this.RemarksTransaksi,
    this.DateTransaksi,
  });
  late final int FormRekeningID;
  late final int TORekeningID;
  late final int NominalTransaksi;
  late final String TitleTransaksi;
  late final String RemarksTransaksi;
  late final String? DateTransaksi;
  String? error;

  TransaksiModel.withError(String s) {
    error = s;
  }

  TransaksiModel.fromJson(Map<String, dynamic> json) {
    FormRekeningID = json['FormRekeningID'];
    TORekeningID = json['TORekeningID'];
    NominalTransaksi = json['NominalTransaksi'];
    TitleTransaksi = json['TitleTransaksi'];
    RemarksTransaksi = json['RemarksTransaksi'];
    DateTransaksi = json['DateTransaksi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['FormRekeningID'] = FormRekeningID;
    data['TORekeningID'] = TORekeningID;
    data['NominalTransaksi'] = NominalTransaksi;
    data['TitleTransaksi'] = TitleTransaksi;
    data['RemarksTransaksi'] = RemarksTransaksi;
    data['DateTransaksi'] = DateTransaksi;
    return data;
  }
}
