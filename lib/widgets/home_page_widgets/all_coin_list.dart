import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'coin_card.dart';

class CoinsListView extends StatelessWidget {
  const CoinsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoinCubit, CoinState>(
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
                  return CoinCard(
                    coin: state.allCoinsList[index],
                  );
                },
              ),
            );
          } else if (state is CoinErrorState) {
            return const Text('Something gone wrong');
          }
          return const SizedBox();
        },
        listener: (context, state) {});
  }
}
