part of 'coin_cubit.dart';

abstract class CoinState extends Equatable {
  const CoinState();

  @override
  List<Object> get props => [];
}

class CoinInitialState extends CoinState {}

class CoinLoadingState extends CoinState {}

class CoinLoadedState extends CoinState {
  final List<CoinModel> allCoinsList;

  const CoinLoadedState({required this.allCoinsList});
}

class CoinErrorState extends CoinState {
  final String message;
  const CoinErrorState(this.message);
}
