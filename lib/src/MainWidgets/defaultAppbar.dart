import 'package:flutter/material.dart';
import './backBtn.dart';

Widget defaultAppBar({
  @required BuildContext context,
  @required String title,
  Function onPress,
  bool hasBack = false,
  double elevation,
  Widget icon,
  List<Widget> actions,
}) {
  return AppBar(
    elevation: elevation ?? 4,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    centerTitle: true,
    actions: actions ?? [],
    leading: hasBack
        ? BackBtn(
            color: Colors.white,
            onPress: onPress,
          )
        : icon ?? SizedBox(),
    backgroundColor: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
  );
}

Widget defaultClipAppBar(
    {@required BuildContext context,
    @required String title,
    @required double width,
    Function onPress,
    bool userAppBar = false,
    Widget imageWidget}) {
  return PreferredSize(
    preferredSize: Size(width, width * 0.7226666666666667),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onPress == null
            ? Container()
            : Positioned(
                top: 40,
                left: 5,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context)),
              ),
        userAppBar
            ? Align(
               alignment: Alignment.bottomCenter,
               child: imageWidget)
            : Container()
      ],
    ),
  );
}
