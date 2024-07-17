import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: HexColor("#8249B5"),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                HexColor("#8249B5"),
                HexColor("#8249B5"),
                Color(0xFFC9AAFF),
                Color(0xFFC9AAFF),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF2E9FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            topLeft: Radius.circular(6))),
                    fixedSize: const Size(340, 60),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  child: FittedBox(
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios,
                            color: HexColor("#323232"), size: 32),
                        Text(
                          "Back To Home Screen",
                          style: TextStyle(
                            fontSize: 26,
                            color: HexColor("#323232"),
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 340,
                height: 100,
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: HexColor("#FBFBFB"),
                      labelText: "Type Something Here To Search..",
                      labelStyle: TextStyle(color: HexColor("#323232B2")),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide.none)),
                ),
              ),
              Container(
                width: 340,
                height: 300,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      color: HexColor("#FBFBFB"),
                      child: ListTile(
                        dense: true,
                        
                        title: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0)
                                  .add(EdgeInsets.only(left: 12)),
                              child: Text(
                                "“All I required to be happy was friendship and people I could admire.”",
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
                                  "Christian Dior",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor("#323232B2"),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.04,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: HexColor("#FBFBFB"),
                                        side: BorderSide(
                                            width: 2, color: HexColor("#8249B5")),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(6))),
                                        fixedSize: const Size(270, 45),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.favorite_border,
                                            color: HexColor("#8249B5"),
                                            size: 32,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Remove From Favorite",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: HexColor("#8249B5"),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
