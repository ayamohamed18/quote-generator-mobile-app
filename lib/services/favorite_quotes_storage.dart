import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quote_generator_mobile_app/models/quote.dart';
import 'package:quote_generator_mobile_app/services/quotes_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteQuotesStorage{

  final String apiUrl ="https://api.quotable.io";
QuoteService quoteService=QuoteService();


  Future<void> addFavoriteQuote(String id) async {
    final prefs = await SharedPreferences.getInstance();
   final favorites = await getFavoriteQuoteIds();
    favorites.add(id);
    await prefs.setStringList('favorites', favorites);
  }



     Future<void> removeFavoriteQuote(String id) async {
      final prefs = await SharedPreferences.getInstance();
   final favorites = await getFavoriteQuoteIds();
    favorites.remove(id);
    await prefs.setStringList('favorites', favorites);
  }

Future <List<String>>getFavoriteQuoteIds()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
           return prefs.getStringList('favorites')?? [];
}


Future<List<Quote>> fetchFavoriteQuotes() async {
    final favoriteIds = await getFavoriteQuoteIds();
     print('Favorite IDs: $favoriteIds');
     try{
   final favoriteQuotes= await Future.wait(favoriteIds.map((id)async{
    try{
    return await quoteService.fetchQuotesByIds(id);}catch(e){
          print('Failed to fetch quote with ID: $id, Error: $e');
          throw Exception('Failed to fetch quote with ID: $id');
          
        }
        
   }));
    print('Favorite Items: $favoriteQuotes');
    return favoriteQuotes;
  }catch (e) {
      print('Failed to load favorite quotes: $e');
      throw Exception('Failed to load favorite quotes');
    }


}}