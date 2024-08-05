import 'dart:convert';

import 'package:quote_generator_mobile_app/models/quote.dart';
import 'package:http/http.dart' as http;


class QuoteService{
  final String apiUrl ="https://api.quotable.io";


  Future<Quote> fetchRandomQuote() async {
    final response = await http.get(Uri.parse('$apiUrl/random'));

    if (response.statusCode == 200) {
       dynamic parsedJson = jsonDecode(response.body);

      
        return Quote.fromJson(parsedJson);
      
    } else {
      throw Exception('Failed to load quote');
    }
  }

  Future<Quote> fetchQuotesByIds(String id) async {

final response = await http.get(Uri.parse('$apiUrl/quotes/$id'));                    
      if (response.statusCode == 200) {
       return Quote.fromJson(json.decode(response.body));
      }else {
      throw Exception('Failed to load item');
    }
    
  }

  

 

  }
