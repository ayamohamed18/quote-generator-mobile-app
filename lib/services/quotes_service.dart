import 'dart:convert';

import 'package:quote_generator_mobile_app/models/quote.dart';
import 'package:http/http.dart' as http;


class QuoteService{
  final String apiUrl ="https://api.quotable.io";


  Future <List<Quote>>fetchRandomQutes()async{
    final response=await http.get(Uri.parse('$apiUrl/random'));

    if (response.statusCode == 200) {
      List<dynamic> data=jsonDecode(response.body);
  List<Quote> quotes = data.map((quoteJson) {
        return Quote.fromJson(quoteJson as Map<String, dynamic>);
      }).toList(); return quotes;
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  Future <Quote>fetchQuoteById(int id)async{
    final response=await http.get(Uri.parse('$apiUrl/quotes/:id'));

 if (response.statusCode == 200) {
      return Quote.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load quote');
    }
  }

  }
