import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quote_generator_mobile_app/bloc/bloc/home_bloc.dart';
import 'package:quote_generator_mobile_app/models/quote.dart';

class QuoteTile extends StatelessWidget {
  final Quote quotes;

  const QuoteTile({super.key, required this.quotes});

  @override
  Widget build(BuildContext context) {
   
        
        return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
          color: HexColor("#FBFBFB")),
      margin: EdgeInsets.only(top: 20),
      width: 300,
child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0).add(EdgeInsets.only(left: 12)),
            child: Text(
              quotes.content.toString(),
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
                quotes.author.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: HexColor("#323232B2"),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("#8249B5"),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(6))),
                      fixedSize: const Size(150, 48),
                    ),
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context).add(FetchRandomQuotes());
                    },
                    child: FittedBox(
                      child: Text(
                        "Generate Another Quote",
                        style:
                            TextStyle(fontSize: 20, color: HexColor("#FBFBFB")),
                      ),
                    )),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#FBFBFB"),
                    side: BorderSide(width: 2, color: HexColor("#8249B5")),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(6))),
                    fixedSize: const Size(90, 48),
                  ),
                  onPressed: () {
                    
                    BlocProvider.of<HomeBloc>(context).add(AddToFavorites(id: int.parse(quotes.id!)));
                  },
                  child: Icon(
                    Icons.favorite,
                    color: HexColor("#8249B5"),
                    size: 32,
                  )),
            ],
          ),
        ],
      ),
        );
          
        
      
      
      
      
      
      
    
  }
}
