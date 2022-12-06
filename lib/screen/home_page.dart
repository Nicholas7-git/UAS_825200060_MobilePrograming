import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_money/screen/bloc/home_bloc.dart';
import 'package:one_money/screen/transfer_page.dart';
import 'package:one_money/screen/widget/history_card.dart';
import 'package:one_money/screen/widget/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/images/transfer.png',
    'assets/images/tracking.png',
    'assets/images/withdraw.png',
  ];

  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    _homeBloc.add(LoadNews(page: 1));
    super.initState();
  }

  Widget _spacer(int space) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height / 100) * space,
      ),
    );
  }

  Widget _appBar() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          top: (MediaQuery.of(context).size.height / 100) * 5,
          left: (MediaQuery.of(context).size.width / 100) * 5,
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/hamburger.png',
              width: (MediaQuery.of(context).size.width / 100) * 7,
            ),
            Container(
              width: (MediaQuery.of(context).size.width / 100) * 15,
              height: (MediaQuery.of(context).size.width / 100) * 15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 5,
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Selamat Pagi",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              "Nicholas Saputra",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 30,
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
      child: SizedBox(
        height: (MediaQuery.of(context).size.height / 100) * 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width / 100) * 5,
            right: (MediaQuery.of(context).size.width / 100) * 5,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                right: (MediaQuery.of(context).size.width / 100) * 5,
              ),
              child: Image.asset('assets/images/kartu.png'),
            );
          },
        ),
      ),
    );
  }

  Widget _historyTransaction() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 5,
          right: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Riwayat Transaksi",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Lihat Semua",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 1,
            ),
            // History Card Food
            const HistoryCard(
              image: 'assets/images/nasgor.jpeg',
              title: 'Makanan',
              desc: 'Nasi Goreng',
              hours: '13:24',
              date: 'Senin, 12 Juli 2021',
              price: 'Rp. 25.000',
            ),
            const HistoryCard(
              image: 'assets/images/gofood.jpg',
              title: 'Go-Food',
              desc: 'Go-Food Richeese Factory',
              hours: '21:50',
              date: 'Minggu, 18 Juli 2021',
              price: 'Rp. 120.000',
            ),
            const HistoryCard(
              image: 'assets/images/pulsa.jpg',
              title: 'Pulsa',
              desc: 'Isi ulang pulsa',
              hours: '21:50',
              date: 'Rabu, 21 Juli 2021',
              price: 'Rp. 50.000',
            ),
          ],
        ),
      ),
    );
  }

  Widget _operation() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transaksi",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 20,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height / 100) * 2,
                      right: (MediaQuery.of(context).size.width / 100) * 5,
                    ),
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransferPage(),
                            ),
                          );
                        }
                      },
                      child: Image.asset(imgList[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listNews() {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (_) => _homeBloc,
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is NewsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsLoaded) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width / 100) * 5,
                    right: (MediaQuery.of(context).size.width / 100) * 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Berita hari ini",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.topHeadlines.articles.length,
                          itemBuilder: (context, index) {
                            return NewsCard(
                              source: state
                                  .topHeadlines.articles[index].source.name,
                              title: state.topHeadlines.articles[index].title,
                              description: state
                                  .topHeadlines.articles[index].description,
                              urlImage:
                                  state.topHeadlines.articles[index].urlToImage,
                              publishedAt: state
                                  .topHeadlines.articles[index].publishedAt,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          _appBar(),
          _spacer(4),
          _title(),
          _spacer(4),
          _card(),
          _spacer(2),
          _operation(),
          _spacer(2),
          _historyTransaction(),
          _spacer(2),
          _listNews(),
          _spacer(2),
        ],
      ),
    );
  }
}
