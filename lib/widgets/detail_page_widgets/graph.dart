import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../constants/const_colors.dart';
import '../../constants/const_func.dart';
import '../../constants/const_texts.dart';
import '../../model/chart_model.dart';
import '../../model/coin_model.dart';

// ignore: must_be_immutable
class DetailGraph extends StatelessWidget {
  CoinModel coin;
  DetailGraph({required this.coin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<ChartData> chartData;

    late TooltipBehavior _tooltipBehavior;
    chartData = getChartData(coin);
    _tooltipBehavior = TooltipBehavior(enable: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCoinInfo(),
        buildGraph(_tooltipBehavior, chartData),
      ],
    );
  }

  SizedBox buildGraph(
      TooltipBehavior _tooltipBehavior, List<ChartData> chartData) {
    return SizedBox(
      height: 200,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        plotAreaBorderColor: ConstColors.detailPageColor,
        plotAreaBackgroundColor: ConstColors.detailPageColor,

        tooltipBehavior: _tooltipBehavior,
        zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
        //AreaSeries   LineSeries
        series: <AreaSeries<ChartData, int>>[
          AreaSeries(
              color: const Color.fromARGB(255, 7, 114, 11),
              dataSource: chartData,
              // width: 4,
              isVisible: true,
              gradient: LinearGradient(colors: [
                Colors.green.shade400,
                Colors.green.shade500,
                Colors.green.shade600,
                Colors.green.shade700,
                Colors.green.shade800,
                Colors.green.shade900,
              ]),
              animationDuration: 2000,
              animationDelay: 1,
              xValueMapper: (ChartData sales, _) => sales.time,
              yValueMapper: (ChartData sales, _) => sales.price,
              dataLabelSettings: const DataLabelSettings(isVisible: false),
              enableTooltip: true)
        ],
        primaryXAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.hide,
          interval: 1,
          isVisible: false,

          //title: AxisTitle(text: 'Time'),
        ),
        primaryYAxis: NumericAxis(
          labelFormat: '{value}\$',
          isVisible: false,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          //title: AxisTitle(text: 'Price'),
        ),
      ),
    );
  }

  Padding buildCoinInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                coin.id.toString() + '/USD',
                style: ConstText.detayTextStyle,
              ),
            ],
          ),
          Text(ConstFunc.priceBelirle(coin.price!),
              style: ConstText.detayTextStyle),
          Text(
            '24h (' +
                (double.parse(coin.the1D!.priceChangePct!) * 100)
                    .toStringAsFixed(2) +
                ')%',
            style: TextStyle(
                color: ConstFunc.buildPriceColor(coin),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  List<ChartData> getChartData(CoinModel coin) {
    List<ChartData> temp = [];
    double price = double.parse(coin.price!);
    for (int i = 0; i < 45; i++) {
      var rndDouble = Random().nextDouble();
      double newPrice;
      bool artiMi = Random().nextBool();
      if (artiMi) {
        newPrice = rndDouble * price / 50;
        price += newPrice;
      } else {
        newPrice = -rndDouble * price / 60;
        price += newPrice;
      }

      temp.add(ChartData(i + 1, price));
    }
    temp.add(ChartData(46, double.parse(coin.price!)));
    return temp;
  }
}
