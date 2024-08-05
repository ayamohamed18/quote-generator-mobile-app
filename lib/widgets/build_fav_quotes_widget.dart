import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quote_generator_mobile_app/bloc/bloc/home_bloc.dart';
import 'package:quote_generator_mobile_app/models/quote.dart';


class BuildfavQuotesWidget extends StatefulWidget {
    final List<Quote> favoriteQuotes;

  BuildfavQuotesWidget({super.key, required this.favoriteQuotes});

  @override
  State<BuildfavQuotesWidget> createState() => _BuildfavQuotesListState();
}

class _BuildfavQuotesListState extends State<BuildfavQuotesWidget> {
  final TextEditingController _searchController = TextEditingController();
     List<Quote> _favoriteQuotes = [];
  List<Quote> _filteredQuotes = [];

 @override
  void initState() {
    super.initState();
        _searchController.addListener(_onSearchChanged);
         final state = BlocProvider.of<HomeBloc>(context).state;
         if (state is FavoriteQuotesLoaded) {
      _favoriteQuotes = state.favoriteQuote;
      _filteredQuotes = _favoriteQuotes;

    }

  }

   void _onSearchChanged() {
 setState(() {
      _filteredQuotes = _favoriteQuotes.where((quote) {
        final query = _searchController.text.toLowerCase();
        return quote.content.toString().toLowerCase().contains(query) ||
               quote.author.toString().toLowerCase().contains(query);
      }).toList();
          print('Filtered Quotes: $_filteredQuotes');

    }); 
     }


 @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: MediaQuery.of(context).size.height * 0.15),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF2E9FF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6), topLeft: Radius.circular(6))),
            fixedSize: const Size(340, 60),
          ),
          onPressed: () {
            Navigator.pop(context);
            context.read<HomeBloc>().add(FetchRandomQuotes());
          },
          child: FittedBox(
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios,
                    color: HexColor("#323232"), size: 32),
                Text(
                  "Back To Home Screen",
                  style: TextStyle(
                    fontSize: 26,
                    color: HexColor("#323232"),
                  ),
                ),
              ],
            ),
          )),
      Container(
        padding: const EdgeInsets.only(top: 20),
        width: 340,
        height: 100,
        child: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
              filled: true,
              fillColor: HexColor("#FBFBFB"),
              labelText: "Type Something Here To Search..",
              labelStyle: TextStyle(color: HexColor("#323232B2")),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide.none)),
                  
        ),
      ),
      Expanded(
        child: BlocBuilder<HomeBloc, HomeBlocState>(
          builder: (context, state) {
            if (state is FavoriteQuotesLoaded) { 
            //   _filteredQuotes = state.favoriteQuote;
              if (_filteredQuotes.isEmpty) {
                return Center(child: Text('No favorites yet'));
              }
                   
              return ListView.builder(
                itemCount: _filteredQuotes.length,
                
                itemBuilder: (context, index) {
                  final favQuote=_filteredQuotes[index];
                  return Card(
                    color: HexColor("#FBFBFB"),
                    child: ListTile(
                      dense: true,
                      title: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0)
                                .add(EdgeInsets.only(left: 12)),
                            child: Text(
                              favQuote.content.toString(),
                              style: TextStyle(
                                fontSize: 26,
                                color: HexColor("#323232"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 140),
                            child: FittedBox(
                              child: Text(
                                favQuote.author.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: HexColor("#323232B2"),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: HexColor("#FBFBFB"),
                                      side: BorderSide(
                                          width: 2,
                                          color: HexColor("#8249B5")),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(6))),
                                      fixedSize: const Size(270, 45),
                                    ),
                                    onPressed: () {
                                      context.read<HomeBloc>().add(
                                          RemoveFromFavorites(
                                              id: favQuote
                                                  .id
                                                  .toString()));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.favorite_border,
                                          color: HexColor("#8249B5"),
                                          size: 32,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Remove From Favorite",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: HexColor("#8249B5"),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is HomeError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      )
    ]);
  }
}
