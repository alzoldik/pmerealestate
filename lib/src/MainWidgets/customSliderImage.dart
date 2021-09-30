import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'networkImage.dart';

class CustomSliderImage extends StatelessWidget {
  final List sliderItems;

  const CustomSliderImage({Key key, this.sliderItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.fill,
      images: List.generate(sliderItems.length, (int index) {
        return CustomProductImage(
          image: sliderItems[index].photo,
        );
      }),
      autoplay: false,
      dotIncreasedColor: Theme.of(context).primaryColor,
      dotIncreaseSize: 2,
      dotSize: 5,
      dotSpacing: 20,
      autoplayDuration: Duration(seconds: 1),
      dotBgColor: Color(0x00000000),
      animationCurve: Curves.decelerate,
      animationDuration: Duration(milliseconds: 1000),
      indicatorBgPadding: 10,
      dotColor: Colors.white,
      dotVerticalPadding: 10,
    );
  }
}
