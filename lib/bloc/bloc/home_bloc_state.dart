part of 'home_bloc.dart';

abstract class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoading extends HomeBlocState {}

class HomeLoaded extends HomeBlocState {
  final List<Quote> quotes;
  final int favoriteCount;

  HomeLoaded(this.quotes,this.favoriteCount);
}

class FavoriteCountLoaded extends HomeBlocState { // New state
    final int favoriteCount;


  FavoriteCountLoaded(this.favoriteCount);
}


class HomeError extends HomeBlocState {
  final String message;

  HomeError(this.message);
}
