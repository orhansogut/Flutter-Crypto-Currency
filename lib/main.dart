import 'package:crypto_currency/constants/const_colors.dart';
import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:crypto_currency/pages/home_page.dart';
import 'package:crypto_currency/repository/coin_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'locator_getit/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoinCubit(FetchCoinRepository()),
        ),
       
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Crypto Currency',
          theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(),
              primarySwatch: ConstColors.anaRenk,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: const HomePage()),
    );
  }
}
