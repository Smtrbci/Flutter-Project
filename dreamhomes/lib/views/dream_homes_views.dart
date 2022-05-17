import 'package:flutter/material.dart';

import '../cosnstant/color_cosnstant.dart';
import '../cosnstant/fontweight_constant.dart';
import '../product/model.dart';

class DreamHomes extends StatefulWidget {
  const DreamHomes({Key? key}) : super(key: key);

  @override
  State<DreamHomes> createState() => _DreamHomesState();
}

class _DreamHomesState extends State<DreamHomes> {
  var isSelected = false;
  var icon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarMethod(),
      body: Column(
        children: [
          _listRowMethod(),
          SizedBox(
            height: 579,
            child: GridView.builder(
              itemCount: listem.length,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 4.0 / 5.0,
                mainAxisSpacing: 40,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(25),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: [
                          Image.asset(
                            listem[index].resim ?? "",
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              listem[index].satilik ?? "",
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorConstants.bgBlue),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(12.0)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.location_on,
                                size: 18, color: ColorConstants.iconColor),
                            label: Text(listem[index].harita ?? ""),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorConstants.bgWhite),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(12.0)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  ColorConstants.fgBlack),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: const BorderSide(
                                      color: ColorConstants.brBlue),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            listem[index].ev ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeightConstant.textBold,
                                fontSize: 25),
                          ),
                          Text(
                            listem[index].fiyat ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(listem[index].adres ?? "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15)),
                          Text(
                            listem[index].dolar ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeightConstant.textBold,
                                fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(100, 30, 58, 80),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 30, 58, 80)),
            label: "Home",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt, color: Color.fromARGB(255, 30, 58, 80)),
            label: "Save",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded,
                color: Color.fromARGB(255, 30, 58, 80)),
            label: "Category",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded,
                color: Color.fromARGB(255, 30, 58, 80)),
            label: "Profile",
            backgroundColor: Colors.white,
          ),
        ],
        fixedColor: const Color.fromARGB(255, 30, 58, 80),
      ),
      backgroundColor: Colors.white,
    );
  }

  Padding _listRowMethod() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Best Offers",
            style: TextStyle(
                fontWeight: FontWeightConstant.textBold, fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: const [
                Text('All Categories'),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: ColorConstants.iconColor,
                  size: 40,
                ),
              ],
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorConstants.bgWhite),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(2.0)),
              foregroundColor:
                  MaterialStateProperty.all<Color>(ColorConstants.fgBlack),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(color: ColorConstants.brBlue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBarMethod() {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0.0,
      title: const Text(
        'Mumbai',
        style: TextStyle(
            fontWeight: FontWeightConstant.textBold,
            color: ColorConstants.textBlack),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person,
              color: ColorConstants.iconColor, size: 30),
        ),
      ],
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.location_on,
          color: ColorConstants.iconColor,
          size: 30,
        ),
      ),
    );
  }
}
