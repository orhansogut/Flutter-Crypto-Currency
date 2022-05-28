// ignore_for_file: must_be_immutable, file_names

import 'package:crypto_currency/constants/const_texts.dart';
import 'package:crypto_currency/model/coin_model.dart';
import 'package:flutter/material.dart';

import '../../constants/const_func.dart';

class DetailTabBar extends StatefulWidget {
  CoinModel coin;

  DetailTabBar({required this.coin, Key? key}) : super(key: key);

  @override
  State<DetailTabBar> createState() => _DetailTabBarState();
}

class _DetailTabBarState extends State<DetailTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TabBar(controller: tabController, tabs: [
            tabBarTabs('1D'),
            tabBarTabs('1W'),
            tabBarTabs('1M'),
            tabBarTabs('1Y'),
            tabBarTabs('ALL'),
          ]),
          SizedBox(
            height: 350,
            child: TabBarView(controller: tabController, children: [
              buildCoinDetail(widget.coin.the1D!),
              buildCoinDetail(widget.coin.the7D!),
              buildCoinDetail(widget.coin.the30D!),
              buildCoinDetail(widget.coin.the365D!),
              buildCoinDetail(widget.coin.ytd!),
            ]),
          )
        ],
      ),
    );
  }

  Text coinDetailTextTitle(String title) {
    return Text(
      title,
      style: ConstText.detailTabBarTextStyle1,
    );
  }

  Row coinDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: ConstText.detailTabBarTextStyle2,
        ),
        Text(
          value,
          style: ConstText.detailTabBarTextStyle2,
        )
      ],
    );
  }

  String stringToFixedString(String str) {
    return double.parse(str).toStringAsFixed(2);
  }

  SingleChildScrollView buildCoinDetail(The1D the) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            coinDetailTextTitle('Info'),
            coinDetailRow('Name', widget.coin.name!),
            coinDetailRow('Rank', widget.coin.rank!),
            coinDetailRow('First Trade',
                widget.coin.firstTrade!.toString().substring(0, 10)),
            coinDetailRow(
              'All Time High',
              ConstFunc.priceBelirle(widget.coin.high!),
            ),
            coinDetailRow(
              'ATH Time',
              widget.coin.highTimestamp!.toString().substring(0, 10),
            ),
            coinDetailTextTitle('Price'),
            coinDetailRow(
              'Last',
              ConstFunc.priceBelirle(widget.coin.price!),
            ),
            coinDetailRow(
              'Price Change',
              ConstFunc.priceBelirle(the.priceChange!),
            ),
            coinDetailRow('Price Chance Pct',
                ConstFunc.priceBelirle(the.priceChangePct!) + '%'),
            coinDetailTextTitle('Volume'),
            coinDetailRow(
              'Volume',
              stringToFixedString(the.volume!),
            ),
            coinDetailRow(
              'Volume Change',
              stringToFixedString(the.volumeChange!),
            ),
            coinDetailRow(
              'Volume Change Pct',
              stringToFixedString(the.volumeChangePct!) + '%',
            ),
            //sorunlu
            coinDetailRow(
              'Market Cap Change ',
              stringToFixedString(the.marketCapChange ?? '0'),
            ),
            coinDetailRow(
              'Market Cap Change Pct',
              stringToFixedString(the.marketCapChangePct ?? '0') + '%',
            ),
          ],
        ),
      ),
    );
  }

  TabBar tabBarOlustur() {
    return TabBar(controller: tabController, tabs: [
      tabBarTabs('1D'),
      tabBarTabs('1W'),
      tabBarTabs('1M'),
      tabBarTabs('1Y'),
      tabBarTabs('ALL'),
    ]);
  }

  Tab tabBarTabs(String d) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        child: Text(d, style: ConstText.detayTextStyle),
      ),
    );
  }
}
