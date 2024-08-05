import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quote_generator_mobile_app/bloc/bloc/home_bloc.dart';

class BuildLoadedHome extends StatelessWidget {
  final int? favoriteCount;
  const BuildLoadedHome({super.key, this.favoriteCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        Stack(
          children: [
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF2E9FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            topLeft: Radius.circular(6))),
                    fixedSize: const Size(300, 60),
                  ),
                  onPressed: () {
                    context.read<HomeBloc>().add(FetchFavoriteQuotes());
                    Navigator.pushNamed(context, "/favorite");
                  },
                  child: FittedBox(
                    child: Text(
                      "Click Here To View Favorite Quotes",
                      style: TextStyle(
                        fontSize: 26,
                        color: HexColor("#323232"),
                      ),
                    ),
                  )),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: HexColor("#323232"),
                    fixedSize: Size(32, 32)),
                    
                child: Text(favoriteCount.toString(),
                    style: TextStyle(
                      color: Color(0xFFF2E9FF),
                    )),
              ),
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<HomeBloc, HomeBlocState>(
            builder: (context, state) {
if(state is HomeLoaded){
  final quote=state.quotes;
                    final isFavorite = state.favorites.contains(quote.id);

              return ListView.builder(
                itemCount: 1,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {

                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6)),
                        color: HexColor("#FBFBFB")),
                    margin: EdgeInsets.only(top: 20),
                    width: 300,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0)
                              .add(EdgeInsets.only(left: 12)),
                          child: Text(
                            quote.content.toString(),
                            style: TextStyle(
                              fontSize: 26,
                              color: HexColor("#323232"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: FittedBox(
                            child: Text(
                              quote.author.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: HexColor("#323232B2"),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor("#8249B5"),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(6))),
                                    fixedSize: const Size(150, 48),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(FetchRandomQuotes());
                                  },
                                  child: FittedBox(
                                    child: Text(
                                      "Generate Another Quote",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: HexColor("#FBFBFB")),
                                    ),
                                  )),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: HexColor("#FBFBFB"),
                                  side: BorderSide(
                                      width: 2, color: HexColor("#8249B5")),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(6))),
                                  fixedSize: const Size(90, 48),
                                ),
                                onPressed: () {
                            

                                  if (isFavorite) {
                                    context.read<HomeBloc>().add(
                                        RemoveFromFavorites(
                                            id: quote.id.toString()));
                                  } else {
                                    context.read<HomeBloc>().add(AddToFavorites(
                                        quote.id.toString()));
                                  }
                                },
                                child: Icon(
                                  (isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border),
                                  color: HexColor("#8249B5"),
                                  size: 32,
                                )),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );

}else{return Center(child: Text("NO Data Here.."),);}
                          }
          ),
        ),
      ],
    );
  }
}
