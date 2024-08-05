import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quote_generator_mobile_app/bloc/bloc/home_bloc.dart';
import 'package:quote_generator_mobile_app/models/quote.dart';

class FavQuoteTile extends StatefulWidget {
  const FavQuoteTile({super.key, required this.quote});
final Quote quote;

  @override
  State<FavQuoteTile> createState() => _FavQuoteTileState();
}

class _FavQuoteTileState extends State<FavQuoteTile> {
    HomeBloc? _homeBloc;
@override
  void initState() {
    super.initState();
        _homeBloc = BlocProvider.of<HomeBloc>(context);

  }
  @override
  Widget build(BuildContext context) {
    return    Container(); }
}