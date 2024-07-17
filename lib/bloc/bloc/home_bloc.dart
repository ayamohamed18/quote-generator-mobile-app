
import 'package:bloc/bloc.dart';
import 'package:quote_generator_mobile_app/models/quote.dart';
import 'package:quote_generator_mobile_app/services/favorite_quotes_storage.dart';
import 'package:quote_generator_mobile_app/services/quotes_service.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final QuoteService quoteService;
  final FavoriteQuotesStorage storage;

  HomeBloc( this.quoteService, this.storage): super(HomeBlocInitial()){

on<FetchRandomQuotes>((event, emit) async {
      emit(HomeLoading());
      try {
        List<Quote> quotes = await quoteService.fetchRandomQutes();
        List<int> favoriteIds = await storage.getFavoriteQuoteIds();
        emit(HomeLoaded(quotes, favoriteIds.length));
      } catch (e) {
        emit(HomeError('Failed to load quotes: $e'));
      }
    });

    on<AddToFavorites>((event, emit) async {
      try {
        await storage.addFavoriteQuote(event.id);
        emit(await _fetchFavoriteCount());
      } catch (e) {
        emit(HomeError('Failed to add to favorites: $e'));
      }
    });

    on<FetchFavoriteQuotesCount>((event, emit) async {
      try {
        emit(await _fetchFavoriteCount());
      } catch (e) {
        emit(HomeError('Failed to load favorite quotes count: $e'));
      }
    });
  }

 Future<HomeBlocState>  _fetchFavoriteCount() async {
    try{
       List<int> favoriteIds = await storage.getFavoriteQuoteIds();
      return FavoriteCountLoaded(favoriteIds.length);
    }catch(e){return HomeError('Failed to fetch favorite count: $e');}
  }
}
