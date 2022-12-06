import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:one_money/config/config.dart';
import 'package:one_money/data/model/transaksi_model.dart';
import 'package:one_money/screen/bloc/transfer_bloc.dart';
import 'package:one_money/screen/viewmodel/transfer_viewmodel.dart';
import 'package:provider/provider.dart';

const List<String> _dropdownItems = <String>[
  'Go-Pay',
  'Dana',
  'Bank BCA',
  'Bank BNI',
  'Bank BRI',
  'Bank Mandiri',
];

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final namaPenerima = TextEditingController();
  final judul = TextEditingController();
  final total = TextEditingController();
  final catatan = TextEditingController();


  Widget _spacer(int space) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height / 100) * space,
      ),
    );
  }

  Widget _cancel(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Inter',
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transfer() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 5,
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Transfer",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 34,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 5,
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Image.asset(
          'assets/images/kartu_balance.png',
        ),
      ),
    );
  }

  Widget _transferButton() {
    return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: EdgeInsets.only(
        left: (MediaQuery.of(context).size.width / 100) * 5,
        right: (MediaQuery.of(context).size.width / 100) * 5,
        bottom: (MediaQuery.of(context).size.height / 100) * 5,
      ),
      child: SizedBox(
        width: double.infinity,
        height: (MediaQuery.of(context).size.height / 100) * 7,
        child: ElevatedButton(
          onPressed: () async {
            String errorMsg = '';
            if(namaPenerima.value.text == ''){
              errorMsg = "Nama Penerima Tidak Boleh Kosong";
            }
            if(judul.value.text == ''){
              errorMsg = "Judul Tidak Boleh Kosong";
            }
            if(total.value.text == ''){
              errorMsg = "Total Tidak Boleh Kosong";
            }
            if(catatan.value.text == ''){
              errorMsg = "Catatan Tidak Boleh Kosong";
            }
            if(errorMsg != ''){
              await EasyLoading.showError(errorMsg);
            }else{
              var rekening = context.read<TransferBloc>().add(GetRekening(namaRekening: Config.rekeningName));
                var a = 0;
              // BlocProvider.of<TransferBloc>(context)
              //   .add(SaveTransaksi(transaksiModel: TransaksiModel(FormRekeningID: Config., TORekeningID: TORekeningID, NominalTransaksi: int.parse(total.value.text), TitleTransaksi: judul.value.text, RemarksTransaksi: catatan.value.text)));
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3131BD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Transfer",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
    );
  }

  // Dropdown
  String? _selectedValue = _dropdownItems.first;

  Widget _dropdown() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width / 100) * 5,
            ),
            child: const Text(
              "Transfer ke",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 100) * 1,
          ),
          Container(
            margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width / 100) * 5,
              right: (MediaQuery.of(context).size.width / 100) * 5,
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: _selectedValue,
              items: _dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _namaPenerima() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width / 100) * 5,
            ),
            child: const Text(
              "Nama Penerima",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 100) * 1,
          ),
          Container(
            margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width / 100) * 5,
              right: (MediaQuery.of(context).size.width / 100) * 5,
            ),
            child: TextFormField(
              controller: namaPenerima,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Masukkan nama penerima",
                hintStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _etTitle() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width / 100) * 5,
            ),
            child: const Text(
              "Judul",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 100) * 1,
          ),
          Container(
            margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width / 100) * 5,
              right: (MediaQuery.of(context).size.width / 100) * 5,
            ),
            child: TextFormField(
              controller: judul,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Masukkan nama pengeluaran",
                hintStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _etTotalMoney() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 5,
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Uang",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: total,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: "Rp. 0",
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _etNote() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 5,
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Catatan",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: catatan,
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: "Masukkan catatan",
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var transferViewModel = Provider.of<TransferViewModel>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _spacer(5),
              _cancel(context),
              _transfer(),
              _spacer(2),
              _card(),
              _spacer(2),
              _dropdown(),
              _spacer(2),
              _namaPenerima(),
              _spacer(2),
              _etTitle(),
              _spacer(2),
              _etTotalMoney(),
              _spacer(2),
              _etNote(),
              _spacer(16),
            ],
          ),
          Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: EdgeInsets.only(
        left: (MediaQuery.of(context).size.width / 100) * 5,
        right: (MediaQuery.of(context).size.width / 100) * 5,
        bottom: (MediaQuery.of(context).size.height / 100) * 5,
      ),
      child: SizedBox(
        width: double.infinity,
        height: (MediaQuery.of(context).size.height / 100) * 7,
        child: ElevatedButton(
          onPressed: () async {
            String errorMsg = '';
            if(namaPenerima.value.text == ''){
              errorMsg = "Nama Penerima Tidak Boleh Kosong";
            }
            if(judul.value.text == ''){
              errorMsg = "Judul Tidak Boleh Kosong";
            }
            if(total.value.text == ''){
              errorMsg = "Total Tidak Boleh Kosong";
            }
            if(catatan.value.text == ''){
              errorMsg = "Catatan Tidak Boleh Kosong";
            }
            if(errorMsg != ''){
              await EasyLoading.showError(errorMsg);
            }else{
              EasyLoading.show();
              TransaksiModel transaksiModel = TransaksiModel(FormRekeningID: 1, TORekeningID: 2, NominalTransaksi: int.parse(total.value.text), TitleTransaksi: judul.value.text, RemarksTransaksi: catatan.value.text);
              var rekening = await transferViewModel.saveTransaksi(transaksiModel);
              EasyLoading.showInfo(rekening);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3131BD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Transfer",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
    ),
        ],
      ),
    );
  }
}
