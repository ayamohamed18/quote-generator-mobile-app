import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/models/quote.dart';
import 'package:quote_generator_mobile_app/services/favorite_quotes_storage.dart';
import 'package:quote_generator_mobile_app/services/quotes_service.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final QuoteService quoteService;
  final FavoriteQuotesStorage storage;
    List<Quote> _favoriteQuotes = [];


  HomeBloc(this.quoteService, this.storage) : super(HomeBlocInitial()) {
    on<FetchRandomQuotes>((event, emit) async {
      emit(HomeLoading());
      try {
        Quote quotes = await quoteService.fetchRandomQuote();
        final favoriteIds = await storage.getFavoriteQuoteIds();
        emit(HomeLoaded(quotes, favoriteIds));
      } catch (e) {
        emit(HomeError('Failed to load quotes: $e'));
      }
    });
    on<AddToFavorites>((event, emit) async {
      if (state is HomeLoaded) {
        await storage.addFavoriteQuote(event.id);
        final quote = (state as HomeLoaded).quotes;
        final favorites = await storage.getFavoriteQuoteIds();
        emit(HomeLoaded(quote, favorites));
      }
    });

    on<RemoveFromFavorites>((event, emit) async {
      await storage.removeFavoriteQuote(event.id);
      if (state is HomeLoaded) {
        final favorites = await storage.getFavoriteQuoteIds();
        final quote = (state as HomeLoaded).quotes;
        emit(HomeLoaded(quote, favorites));
      }
    });

    on<FetchFavoriteQuotesCount>((event, emit) async {
      try {
        final favorites = await storage.getFavoriteQuoteIds();

        emit(FavoriteCountLoaded(favorites.length));
      } catch (e) {
        emit(HomeError('Failed to load favorite quotes count: $e'));
      }
    });

    on<FetchFavoriteQuotes>((event, emit) async {
      emit(HomeLoading());
      try {
        final favoriteQuote = await storage.fetchFavoriteQuotes();
        emit(FavoriteQuotesLoaded(favoriteQuote));
      } catch (e) {
        emit(HomeError('Failed to load favorite quotes count: $e'));
      }
    });

   /* on<SearchQuotes>((event, emit) async {
     final query = event.query.toLowerCase();
     _favoriteQuotes=()
    final filteredQuotes = _favoriteQuotes.where((quote) {
      return quote.content.toString().toLowerCase().contains(query) ||
             quote.author.toString().toLowerCase().contains(query);
    }).toList();
  
    print('filtered Quotes : $filteredQuotes');
      emit(FavoriteQuotesLoaded(filteredQuotes));
    });
  }*/


  }}
