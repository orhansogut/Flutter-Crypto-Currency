import 'package:crypto_currency/constants/const_colors.dart';
import 'package:crypto_currency/constants/const_texts.dart';
import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:crypto_currency/widgets/home_page_widgets/custom_search.dart';
import 'package:crypto_currency/widgets/home_page_widgets/listview_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home_page_widgets/coin_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSettings(context),
      body: Column(
        children: [
          const CoinTitle(),
          Expanded(
              child: BlocConsumer<CoinCubit, CoinState>(
                  builder: (context, state) {
                    if (state is CoinInitialState) {
                      context.read<CoinCubit>().getCoins();
                    } else if (state is CoinLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CoinLoadedState) {
                      return RefreshIndicator(
                        onRefresh: () => context.read<CoinCubit>().getCoins(),
                        child: ListView.builder(
                          itemCount: state.allCoinsList.length,
                          itemBuilder: (context, index) {
                            return CoinCard(coin: state.allCoinsList[index]);
                          },
                        ),
                      );
                    } else if (state is CoinErrorState) {
                      return const Text('Something gone wrong');
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  listener: (context, state) {})),
        ],
      ),
    );
  }

  AppBar appBarSettings(BuildContext context) {
    return AppBar(
        backgroundColor: ConstColors.appBarRenk,
        elevation: 0,
        actions: const [SearchWidget()],
        title: const Center(
          child: Text(
            ConstText.appBarTitle,
            style: ConstText.appBarTextStyle,
          ),
        ));
  }
}
