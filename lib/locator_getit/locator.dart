import 'package:crypto_currency/repository/coin_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FetchCoinRepository());
}
// final CoinRepository coinRepository = locator<FetchCoinRepository>();