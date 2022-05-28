import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:crypto_currency/model/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coin_card.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoinCubit, CoinState>(
      listener: (context, state) {},
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                      (state as CoinLoadedState).allCoinsList));
            },
            icon: const Icon(Icons.search));
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<CoinModel> coinList;

  CustomSearchDelegate(this.coinList);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query.isEmpty ? null : query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        close(context, null);
      }),
      child: const Icon(
        Icons.arrow_back_ios,
        size: 24,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<CoinModel> filtredList = coinList
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filtredList.isNotEmpty
        ? ListView.builder(
            itemCount: filtredList.length,
            itemBuilder: (context, index) {
              return CoinCard(coin: filtredList[index]);
            })
        : const Center(child: Text('Not Found Anything'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
