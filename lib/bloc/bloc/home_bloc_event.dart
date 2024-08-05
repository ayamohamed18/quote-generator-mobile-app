part of 'home_bloc.dart';

abstract class HomeBlocEvent {}
class FetchRandomQuotes extends HomeBlocEvent{


}
   
class AddToFavorites extends HomeBlocEvent{
  final String id;

  AddToFavorites(this.id);
}
 
 class RemoveFromFavorites extends HomeBlocEvent{
  final String id;

  RemoveFromFavorites({required this.id});
}
class FetchFavoriteQuotesById extends HomeBlocEvent {
  final String id;

  FetchFavoriteQuotesById({required this.id});
}

class FetchFavoriteQuotes extends HomeBlocEvent{}

/*class SearchQuotes extends HomeBlocEvent {
  final String query;

  SearchQuotes(this.query);
}*/

class FetchFavoriteQuotesCount extends HomeBlocEvent{}