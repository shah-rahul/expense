import 'package:flutter/material.dart';

enum icondata {
  TRAVEL,
  FOOD,
  SHOPPING,
  OTHERS,
}

returnIcon(icondata icon) {
  switch (icon) {
    case icondata.TRAVEL:
      return Icon(Icons.airplanemode_active);
    case icondata.FOOD:
      return Icon(Icons.fastfood);
    case icondata.SHOPPING:
      return Icon(Icons.shopping_cart);
    case icondata.OTHERS:
      return Icon(Icons.money);
  }
}
