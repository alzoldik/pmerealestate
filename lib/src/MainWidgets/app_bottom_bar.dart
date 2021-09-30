import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBottomBar extends StatefulWidget {
  final Function onTap;
  final String userType;
  int inx;

  AppBottomBar({Key key, this.onTap, this.userType, this.inx})
      : super(key: key);
  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int inxShop = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.only(bottom: 0.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedLabelStyle: TextStyle(fontSize: 10),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: widget.userType != 'user' ? inxShop : widget.inx,
          onTap: (index) {
            setState(() {
              widget.inx = index;
              inxShop = index;
            });
            widget.onTap(index);
          },
          items: [
            BottomNavigationBarItem(
              label: "الاشعارات",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage("assets/icon/alarm.png"),
                  size: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "السلة",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage("assets/icon/cart.png"),
                  size: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "الرئيسية",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage("assets/icon/home.png"),
                  size: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "سلة اطعام",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage(
                    "assets/icon/et3amCart.png",
                  ),
                  size: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "حسابي",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage("assets/icon/user.png"),
                  size: 20,
                ),
              ),
            ),
          ]),
    );
  }
}
