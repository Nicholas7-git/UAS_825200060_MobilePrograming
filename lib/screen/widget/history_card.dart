import 'package:flutter/material.dart';
import 'package:one_money/screen/detail_page.dart';

class HistoryCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? desc;
  final String? price;
  final String? hours;
  final String? date;
  const HistoryCard(
      {Key? key,
      this.title,
      this.desc,
      this.price,
      this.hours,
      this.date,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: title,
              desc: desc,
              hours: hours,
              date: date,
              price: price,
            ),
          ),
        );
      },
      child: Card(
        elevation: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: (MediaQuery.of(context).size.height / 100) * 10,
                width: (MediaQuery.of(context).size.width / 100) * 10,
                margin: EdgeInsets.all(
                  (MediaQuery.of(context).size.width / 100) * 2,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('$image'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      desc ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      price ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                  right: (MediaQuery.of(context).size.width / 100) * 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      date ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
