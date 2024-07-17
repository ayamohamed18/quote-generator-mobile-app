part of 'home_bloc.dart';

abstract class HomeBlocEvent {}
class FetchRandomQuotes extends HomeBlocEvent{


  FetchRandomQuotes();
}

class AddToFavorites extends HomeBlocEvent{
  final int id;

  AddToFavorites({required this.id});
}

class FetchFavoriteQuotesCount extends HomeBlocEvent{}