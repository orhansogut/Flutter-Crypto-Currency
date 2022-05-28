import 'package:flutter/material.dart';

class CoinTitle extends StatelessWidget {
  const CoinTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
            child: Row(
              children: const [
                Expanded(
                  flex: 3,
                  child: Text(
                    'COIN NAME',
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'PRICE',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '24H CHANGE',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: SizedBox(
            height: 0,
            child: Divider(
              thickness: 0,
            ),
          ),
        ),
      ],
    );
  }
}
