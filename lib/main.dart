import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/bloc/bloc/home_bloc.dart';
import 'package:quote_generator_mobile_app/screens/favourite_screen.dart';
import 'package:quote_generator_mobile_app/screens/home_screen.dart';
import 'package:quote_generator_mobile_app/services/favorite_quotes_storage.dart';
import 'package:quote_generator_mobile_app/services/quotes_service.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final QuoteService _quoteServices=QuoteService();
  final FavoriteQuotesStorage _storage=FavoriteQuotesStorage();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(_quoteServices, _storage)..add(FetchRandomQuotes()
      ),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'GemunuLibre',
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/favorite': (context) => FavoriteScreen(),
          '/home': (context) => HomeScreen()
        },
      ),
    );
  }
}
