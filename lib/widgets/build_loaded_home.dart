import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quote_generator_mobile_app/models/quote.dart';
import 'package:quote_generator_mobile_app/widgets/quote_tile.dart';

class BuildLoadedHome extends StatelessWidget {
  final List<Quote>? quotes;
  final int? favoriteCount;
  const BuildLoadedHome({super.key, this.quotes, this.favoriteCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                child: Text(favoriteCount.toString(),
                    style: TextStyle(
                      color: Color(0xFFF2E9FF),
                    )),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: HexColor("#323232"),
                    fixedSize: Size(32, 32)),
              ),
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: quotes?.length ?? 0,
                itemBuilder: (context, index) {
                  return QuoteTile(
                    quotes: quotes![index],
                  );
                })),
      ],
    );
  }
}
