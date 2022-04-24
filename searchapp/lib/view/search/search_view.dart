import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:searchapp/cosnstant/fontweight_constant.dart';

import '../../cosnstant/color_constant.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 50),
            _searchTextField(),
            _horizontalListView(),
            _categoryGridView(),
          ],
        ),
        bottomNavigationBar: _bottomBar());
  }

  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: ColorConstants.bottomGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: ColorConstants.bottomGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Wishlist",
            backgroundColor: ColorConstants.bottomGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_card),
            label: "Card",
            backgroundColor: ColorConstants.bottomGreen,
          ),
        ],
      );
  }

  SizedBox _categoryGridView() {
    return SizedBox(
            height: 546,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 4.0 / 5.0,
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(25),
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Biography",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorConstants.textWhite, fontSize: 17),
                      ),
                      Image(
                          image: AssetImage('assets/images/Biography.png'),
                          height: 150,
                          width: 150),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstants.biographyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Business",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorConstants.textWhite, fontSize: 17),
                      ),
                      Image(
                          image: AssetImage('assets/images/Business.png'),
                          height: 150,
                          width: 150),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstants.businessColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Children",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorConstants.textWhite, fontSize: 17),
                      ),
                      Image(
                          image: AssetImage('assets/images/Children.png'),
                          height: 150,
                          width: 150),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstants.childrenColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Cookery",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorConstants.textWhite, fontSize: 17),
                      ),
                      Image(
                          image: AssetImage('assets/images/Cookery.png'),
                          height: 150,
                          width: 150),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstants.cookeryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Fiction",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorConstants.textWhite, fontSize: 17),
                      ),
                      Image(
                          image: AssetImage('assets/images/Fiction.png'),
                          height: 150,
                          width: 150),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstants.fictionColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Graphic Novels",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorConstants.textWhite, fontSize: 17),
                      ),
                      Image(
                          image: AssetImage('assets/images/Graphic.png'),
                          height: 150,
                          width: 150),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstants.graphicColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          );
  }

  SizedBox _horizontalListView() {
    return SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const <Widget>[
                SizedBox(
                  width: 170,
                  child: Center(
                    child: Text(
                      "Genre",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeightConstant.textBold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: Center(
                    child: Text(
                      "New Release",
                      style: TextStyle(
                          fontSize: 20, color: ColorConstants.textGray),
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: Center(
                    child: Text(
                      "The Art",
                      style: TextStyle(
                          fontSize: 20, color: ColorConstants.textGray),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  Padding _searchTextField() {
    return Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Search Books, Authors, or ISBN",
                hintStyle: TextStyle(
                  color: ColorConstants.textGray,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorConstants.iconBlack,
                ),
                suffixIcon: Icon(
                  Icons.settings,
                  color: ColorConstants.iconBlack,
                ),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          );
  }
}
