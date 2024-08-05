part of 'home_bloc.dart';

abstract class HomeBlocState {
  
}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoading extends HomeBlocState {}

class HomeLoaded extends HomeBlocState {
  final Quote quotes;
  //final int favoriteCount;
 final List<String> favorites;

  HomeLoaded(this.quotes, this.favorites);
}

class FavoriteCountLoaded extends HomeBlocState { // New state
    final int favoriteCount;


  FavoriteCountLoaded(this.favoriteCount);
}
class FavoriteQuotesLoaded extends HomeBlocState{
  final List<Quote> favoriteQuote;

  FavoriteQuotesLoaded(this.favoriteQuote); 
}


/*class SearchResults extends HomeBlocState {
  final List<Quote> quotes;
  SearchResults(this.quotes);
}*/
class HomeError extends HomeBlocState {
  final String message;

  HomeError(this.message);
}
