import 'package:crypto_currency/constants/const_func.dart';
import 'package:crypto_currency/constants/const_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../model/coin_model.dart';
import '../../pages/detail_page.dart';

class CoinCard extends StatelessWidget {
  final CoinModel coin;
  const CoinCard({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //sayfayı yenileyince çalışan yer
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailPage(coin: coin)));
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCoinAvatar(),
              const SizedBox(width: 10),
              buildCoinNameID(),
              buildCoinPrice(),
              const SizedBox(width: 10),
              buildCoin24hChange(),
              const SizedBox(width: 5),
              const Icon(Icons.arrow_right_sharp)
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildCoin24hChange() {
    return Expanded(
      child: Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ConstFunc.buildPriceColor(coin),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          (double.parse(coin.the1D!.priceChangePct!) * 100).toStringAsFixed(2) +
              '%',
          textAlign: TextAlign.center,
          style: ConstText.coinPriceTextStyle,
        ),
      ),
    );
  }

  Expanded buildCoinPrice() {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      child: Text(
        ConstFunc.priceBelirle(coin.price!).toString(),
        textAlign: TextAlign.center,
        style: ConstText.coinPriceTextStyle,
      ),
    ));
  }

  Expanded buildCoinNameID() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            coin.name!,
            style: ConstText.coinNameTextStyle,
          ),
          Text(
            coin.id! + '/USD',
            style: ConstText.coinidTextStyle,
          )
        ],
      ),
    );
  }

  CircleAvatar buildCoinAvatar() {
    return CircleAvatar(
      child: getImages(coin),
      backgroundColor: Colors.transparent,
    );
  }

  getImages(CoinModel oanki) {
    if (oanki.logoUrl.toString().contains('svg')) {
      return SvgPicture.network(
        oanki.logoUrl.toString(),
        fit: BoxFit.contain,
      );
    } else {
      return Image.network(
        oanki.logoUrl.toString(),
        fit: BoxFit.contain,
      );
    }
  }
}
