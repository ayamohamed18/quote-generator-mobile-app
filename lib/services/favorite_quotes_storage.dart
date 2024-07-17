import 'package:shared_preferences/shared_preferences.dart';

class FavoriteQuotesStorage{
  static const String key = 'favorite_quotes';

  Future<void>addFavoriteQuote(int id)async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
           List <int> favorites = prefs.getStringList(key)?.map(int.parse)?.toList() ?? [];
            if (!favorites.contains(id)) {
      favorites.add(id);
    }
    await prefs.setStringList(key, favorites.map((id) => id.toString()).toList());
  }


   Future<void>removeFavoriteQuote(int id)async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
           List<int> favorites = prefs.getStringList(key)?.map(int.parse)?.toList() ?? [];
          
      favorites.remove(id);
    
    await prefs.setStringList(key, favorites.map((id) => id.toString()).toList());
  }

Future <List<int>>getFavoriteQuoteIds()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
           return prefs.getStringList(key)?.map(int.parse)?.toList() ?? [];
}


}