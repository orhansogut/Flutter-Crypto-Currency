// To parse this JSON data, do
//
//     final coinModel = coinModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

CoinModel coinModelFromJson(String str) => CoinModel.fromJson(json.decode(str));

String coinModelToJson(CoinModel data) => json.encode(data.toJson());

class CoinModel {
  CoinModel({
    this.id,
    this.currency,
    this.symbol,
    this.name,
    this.logoUrl,
    this.status,
    this.price,
    this.priceDate,
    this.priceTimestamp,
    this.circulatingSupply,
    this.maxSupply,
    this.marketCap,
    this.marketCapDominance,
    this.numExchanges,
    this.numPairs,
    this.numPairsUnmapped,
    this.firstCandle,
    this.firstTrade,
    this.firstOrderBook,
    this.rank,
    this.rankDelta,
    this.high,
    this.highTimestamp,
    this.the1D,
    this.the7D,
    this.the30D,
    this.the365D,
    this.ytd,
  });

  String? id;
  String? currency;
  String? symbol;
  String? name;
  String? logoUrl;
  String? status;
  String? price;
  DateTime? priceDate;
  DateTime? priceTimestamp;
  String? circulatingSupply;
  String? maxSupply;
  String? marketCap;
  String? marketCapDominance;
  String? numExchanges;
  String? numPairs;
  String? numPairsUnmapped;
  DateTime? firstCandle;
  DateTime? firstTrade;
  DateTime? firstOrderBook;
  String? rank;
  String? rankDelta;
  String? high;
  DateTime? highTimestamp;
  The1D? the1D;
  The1D? the7D;
  The1D? the30D;
  The1D? the365D;
  The1D? ytd;

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        id: json["id"] == null ? null : json["id"],
        currency: json["currency"] == null ? null : json["currency"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        name: json["name"] == null ? null : json["name"],
        logoUrl: json["logo_url"] == null ? null : json["logo_url"],
        status: json["status"] == null ? null : json["status"],
        price: json["price"] == null ? null : json["price"],
        priceDate: json["price_date"] == null
            ? null
            : DateTime.parse(json["price_date"]),
        priceTimestamp: json["price_timestamp"] == null
            ? null
            : DateTime.parse(json["price_timestamp"]),
        circulatingSupply: json["circulating_supply"] == null
            ? null
            : json["circulating_supply"],
        maxSupply: json["max_supply"] == null ? null : json["max_supply"],
        marketCap: json["market_cap"] == null ? null : json["market_cap"],
        marketCapDominance: json["market_cap_dominance"] == null
            ? null
            : json["market_cap_dominance"],
        numExchanges:
            json["num_exchanges"] == null ? null : json["num_exchanges"],
        numPairs: json["num_pairs"] == null ? null : json["num_pairs"],
        numPairsUnmapped: json["num_pairs_unmapped"] == null
            ? null
            : json["num_pairs_unmapped"],
        firstCandle: json["first_candle"] == null
            ? null
            : DateTime.parse(json["first_candle"]),
        firstTrade: json["first_trade"] == null
            ? null
            : DateTime.parse(json["first_trade"]),
        firstOrderBook: json["first_order_book"] == null
            ? null
            : DateTime.parse(json["first_order_book"]),
        rank: json["rank"] == null ? null : json["rank"],
        rankDelta: json["rank_delta"] == null ? null : json["rank_delta"],
        high: json["high"] == null ? null : json["high"],
        highTimestamp: json["high_timestamp"] == null
            ? null
            : DateTime.parse(json["high_timestamp"]),
        the1D: json["1d"] == null ? null : The1D.fromJson(json["1d"]),
        the7D: json["7d"] == null ? null : The1D.fromJson(json["7d"]),
        the30D: json["30d"] == null ? null : The1D.fromJson(json["30d"]),
        the365D: json["365d"] == null ? null : The1D.fromJson(json["365d"]),
        ytd: json["ytd"] == null ? null : The1D.fromJson(json["ytd"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "currency": currency == null ? null : currency,
        "symbol": symbol == null ? null : symbol,
        "name": name == null ? null : name,
        "logo_url": logoUrl == null ? null : logoUrl,
        "status": status == null ? null : status,
        "price": price == null ? null : price,
        "price_date": priceDate == null ? null : priceDate!.toIso8601String(),
        "price_timestamp":
            priceTimestamp == null ? null : priceTimestamp!.toIso8601String(),
        "circulating_supply":
            circulatingSupply == null ? null : circulatingSupply,
        "max_supply": maxSupply == null ? null : maxSupply,
        "market_cap": marketCap == null ? null : marketCap,
        "market_cap_dominance":
            marketCapDominance == null ? null : marketCapDominance,
        "num_exchanges": numExchanges == null ? null : numExchanges,
        "num_pairs": numPairs == null ? null : numPairs,
        "num_pairs_unmapped":
            numPairsUnmapped == null ? null : numPairsUnmapped,
        "first_candle":
            firstCandle == null ? null : firstCandle!.toIso8601String(),
        "first_trade":
            firstTrade == null ? null : firstTrade!.toIso8601String(),
        "first_order_book":
            firstOrderBook == null ? null : firstOrderBook!.toIso8601String(),
        "rank": rank == null ? null : rank,
        "rank_delta": rankDelta == null ? null : rankDelta,
        "high": high == null ? null : high,
        "high_timestamp":
            highTimestamp == null ? null : highTimestamp!.toIso8601String(),
        "1d": the1D == null ? null : the1D!.toJson(),
        "7d": the7D == null ? null : the7D!.toJson(),
        "30d": the30D == null ? null : the30D!.toJson(),
        "365d": the365D == null ? null : the365D!.toJson(),
        "ytd": ytd == null ? null : ytd!.toJson(),
      };
}

class The1D {
  The1D({
    this.volume,
    this.priceChange,
    this.priceChangePct,
    this.volumeChange,
    this.volumeChangePct,
    this.marketCapChange,
    this.marketCapChangePct,
  });

  String? volume;
  String? priceChange;
  String? priceChangePct;
  String? volumeChange;
  String? volumeChangePct;
  String? marketCapChange;
  String? marketCapChangePct;

  factory The1D.fromJson(Map<String, dynamic> json) => The1D(
        volume: json["volume"] == null ? null : json["volume"],
        priceChange: json["price_change"] == null ? null : json["price_change"],
        priceChangePct:
            json["price_change_pct"] == null ? null : json["price_change_pct"],
        volumeChange:
            json["volume_change"] == null ? null : json["volume_change"],
        volumeChangePct: json["volume_change_pct"] == null
            ? null
            : json["volume_change_pct"],
        marketCapChange: json["market_cap_change"] == null
            ? null
            : json["market_cap_change"],
        marketCapChangePct: json["market_cap_change_pct"] == null
            ? null
            : json["market_cap_change_pct"],
      );

  Map<String, dynamic> toJson() => {
        "volume": volume == null ? null : volume,
        "price_change": priceChange == null ? null : priceChange,
        "price_change_pct": priceChangePct == null ? null : priceChangePct,
        "volume_change": volumeChange == null ? null : volumeChange,
        "volume_change_pct": volumeChangePct == null ? null : volumeChangePct,
        "market_cap_change": marketCapChange == null ? null : marketCapChange,
        "market_cap_change_pct":
            marketCapChangePct == null ? null : marketCapChangePct,
      };
}
