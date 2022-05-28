// ignore_for_file: must_be_immutable

import 'package:crypto_currency/constants/const_colors.dart';
import 'package:crypto_currency/widgets/detail_page_widgets/graph.dart';
import 'package:crypto_currency/widgets/detail_page_widgets/tabBar.dart';
import 'package:flutter/material.dart';
import 'package:crypto_currency/model/coin_model.dart';

class DetailPage extends StatelessWidget {
  CoinModel coin;
  DetailPage({required this.coin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.detailPageColor,
      appBar: AppBar(
        title: Text(coin.name!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailGraph(coin: coin),
            DetailTabBar(coin: coin),
          ],
        ),
      ),
    );
  }
}
