import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:searchapp/cosnstant/fontweight_constant.dart';
import '../../cosnstant/color_constant.dart';
import '../../product/model.dart';

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

  Widget _categoryGridView() {
    return SizedBox(
      height: 578,
      child: GridView.builder(
        itemCount: listem.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  listem[index].baslik ?? "",
                ),
                Image.asset(listem[index].resim ?? ""),
              ],
            ),
          );
        },
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
                    fontSize: 20, fontWeight: FontWeightConstant.textBold),
              ),
            ),
          ),
          SizedBox(
            width: 170,
            child: Center(
              child: Text(
                "New Release",
                style: TextStyle(fontSize: 20, color: ColorConstants.textGray),
              ),
            ),
          ),
          SizedBox(
            width: 170,
            child: Center(
              child: Text(
                "The Art",
                style: TextStyle(fontSize: 20, color: ColorConstants.textGray),
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
