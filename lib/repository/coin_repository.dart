import 'package:crypto_currency/model/coin_model.dart';
import 'package:dio/dio.dart';


abstract class CoinRepository {
  Future<List<CoinModel>> getCoins();
}

class FetchCoinRepository extends CoinRepository {
  final String _url =
      'https://api.nomics.com/v1/currencies/ticker?key=f5f46f4915fc9541aa469df6ce1357c615cf9543';

  @override
  Future<List<CoinModel>> getCoins() async{
    List<CoinModel> _tempList = [];

    var result = await Dio().get(_url);
    var list = result.data;
    if (list is List) {
      _tempList = list.map((e) => CoinModel.fromJson(e)).toList();
    } else {
      return [];
    }
    return _tempList;
  }
}
