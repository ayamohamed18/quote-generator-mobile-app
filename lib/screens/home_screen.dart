import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quote_generator_mobile_app/bloc/bloc/home_bloc.dart';
import 'package:quote_generator_mobile_app/models/quote.dart';
import 'package:quote_generator_mobile_app/widgets/build_loaded_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc? _homeBloc;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _homeBloc = BlocProvider.of<HomeBloc>(context);
      _homeBloc!.add(FetchRandomQuotes());
        _homeBloc!.add(FetchFavoriteQuotesCount());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: HexColor("#8249B5"),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                HexColor("#8249B5"),
                HexColor("#8249B5"),
                Color(0xFFC9AAFF),
                Color(0xFFC9AAFF),
              ],
            ),
          ),
          child: BlocBuilder<HomeBloc, HomeBlocState>(
            
              bloc: _homeBloc,
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeLoaded) {
                 
                  return BuildLoadedHome(favoriteCount: state.favorites.length,);
                } else if (state is HomeError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
