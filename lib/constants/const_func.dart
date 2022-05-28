import 'package:flutter/material.dart';

import '../model/coin_model.dart';

class ConstFunc {
  static String priceBelirle(String str) {
    double price = double.parse(str);
    if (price.toStringAsFixed(7) == '0.0000000') {
      return price.toStringAsFixed(8);
    } else if (price.toStringAsFixed(6) == '0.000000') {
      return price.toStringAsFixed(7);
    } else if (price.toStringAsFixed(4) == '0.0000') {
      return price.toStringAsFixed(6);
    } else if (price.toStringAsFixed(2) == '0.00') {
      return price.toStringAsFixed(4);
    } else {
      return price.toStringAsFixed(2);
    }
  }

  static Color buildPriceColor(CoinModel oanki) {
    if (oanki.the1D!.priceChange!.contains('-')) {
      return Colors.red.shade400;
    } else {
      return Colors.green.shade600;
    }
  }
}
