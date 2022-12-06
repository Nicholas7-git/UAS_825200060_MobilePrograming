import 'package:flutter/material.dart';
import 'package:one_money/screen/home_page.dart';
import 'package:one_money/screen/widget/separator.dart';

class DetailPage extends StatefulWidget {
  final String? title;
  final String? desc;
  final String? hours;
  final String? date;
  final String? price;

  const DetailPage({
    super.key,
    required this.title,
    required this.desc,
    required this.hours,
    required this.date,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget _spacer(int space) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height / 100) * space,
      ),
    );
  }

  Widget _history() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 5,
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Riwayat",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.ios_share,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _cashReceipt() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 5,
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width / 100) * 5,
                  ),
                  child: Text(
                    widget.date!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: (MediaQuery.of(context).size.width / 100) * 5,
                  ),
                  child: Text(
                    widget.hours!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 4,
            ),
            Container(
              margin: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 100) * 5,
                right: (MediaQuery.of(context).size.width / 100) * 5,
              ),
              child: Text(
                widget.title!,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width / 100) * 5,
              ),
              child: const Separator(),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width / 100) * 5,
                    ),
                    child: const Text(
                      "Deskripsi",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: (MediaQuery.of(context).size.width / 100) * 5,
                    ),
                    child: Text(
                      widget.desc!,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width / 100) * 5,
                    ),
                    child: const Text(
                      "Total harga",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: (MediaQuery.of(context).size.width / 100) * 5,
                    ),
                    child: Text(
                      widget.price!,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width / 100) * 5,
              ),
              child: const Separator(),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 4,
            ),
            // image qr
            Container(
              margin: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 100) * 5,
                right: (MediaQuery.of(context).size.width / 100) * 5,
              ),
              child: Image.asset(
                "assets/images/qr.png",
                width: (MediaQuery.of(context).size.width / 100) * 90,
                height: (MediaQuery.of(context).size.height / 100) * 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeButton() {
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3131BD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Home",
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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF9F9FB),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _spacer(5),
              _history(),
              _spacer(2),
              _cashReceipt(),
            ],
          ),
          _homeButton(),
        ],
      ),
    );
  }
}
