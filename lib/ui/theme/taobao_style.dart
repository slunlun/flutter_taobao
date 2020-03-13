import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//颜色
class TaoBaoColors {
//  static const String primarySwatchString = '#fe7301';
  static const Color primarySwatch1 = Color.fromRGBO(254, 115, 1, 1);

  static const Color tabBarDefaultForeColor = Color.fromRGBO(142, 142, 142, 1);
  static const Color mainBackgroundColor = Color.fromRGBO(241, 242, 241, 1);

  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";
  static const String miWhiteString = "#ececec";
  static const String actionBlueString = "#267aff";
  static const String webDraculaBackgroundColorString = "#282a36";

//  static const int primaryValue = 0xFF24292E;
//  static const int primaryLightValue = 0xFF42464b;
//  static const int primaryDarkValue = 0xFF121917;
  static const int primaryValue = 0xFFfe7301;
  static const int primaryLightValue = 0xFFfe7301;
  static const int primaryDarkValue = 0xFFfe7301;

  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;
  static const int miWhite = 0xffececec;
  static const int white = 0xFFFFFFFF;
  static const int actionBlue = 0xff267aff;
  static const int subTextColor = 0xff959595;
  static const int subLightTextColor = 0xffc4c4c4;

//  static const int mainBackgroundColor = miWhite;

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );
}

class TaoBaoIcons {
  static const String FONT_FAMILY = 'taobaoIconFont';

  static const IconData home = const IconData(0xe6b8, fontFamily: TaoBaoIcons.FONT_FAMILY);
  static const IconData home_active = const IconData(0xe652, fontFamily: TaoBaoIcons.FONT_FAMILY);

  static const IconData we_tao = const IconData(0xe6f5, fontFamily: TaoBaoIcons.FONT_FAMILY);
  static const IconData we_tao_active = const IconData(0xe6f4, fontFamily: TaoBaoIcons.FONT_FAMILY);

  static const IconData message = const IconData(0xe6bc, fontFamily: TaoBaoIcons.FONT_FAMILY);
  static const IconData message_active = const IconData(0xe779, fontFamily: TaoBaoIcons.FONT_FAMILY);

  static const IconData cart = const IconData(0xe6af, fontFamily: TaoBaoIcons.FONT_FAMILY);
  static const IconData cart_active = const IconData(0xe6b9, fontFamily: TaoBaoIcons.FONT_FAMILY);

  static const IconData mine = const IconData(0xe78b, fontFamily: TaoBaoIcons.FONT_FAMILY);
  static const IconData mine_active = const IconData(0xe78c, fontFamily: TaoBaoIcons.FONT_FAMILY);
}