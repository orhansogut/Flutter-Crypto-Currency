import 'package:bloc/bloc.dart';
import 'package:crypto_currency/model/coin_model.dart';
import 'package:equatable/equatable.dart';
import '../repository/coin_repository.dart';
part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  final CoinRepository coinRepository;

  CoinCubit(this.coinRepository) : super(CoinInitialState());

  Future<void> getCoins() async {
    try {
      emit(CoinLoadingState());
      final response = await coinRepository.getCoins();
      emit(CoinLoadedState(allCoinsList: response));
    } catch (e) {
      emit(const CoinErrorState('Coinler Getirilirken Bir Hata Oluştu.'));
    }
  }

}
