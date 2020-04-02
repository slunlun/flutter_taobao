import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaobao/ui/page/search/search_goods_page.dart';
import 'package:fluttertaobao/ui/page/search/search_goods_result_page.dart';

class NavigatorUtils {
  static gotoSearchGoodsPage(BuildContext context, {String keyWords}) {
    Navigator.of(context).push(MyCupertinoPageRouter(SearchGoodsPage(keyWords: keyWords)));
  }

  static gotoSearchGoodsResultPage(BuildContext context, String keywords) {
    navigatorRouter(
        context,
        new SearchGoodsResultPage(
          keyWords: keywords,
        ));
  }

  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }
}


class MyCupertinoPageRouter extends CupertinoPageRoute {
  Widget widget;

  MyCupertinoPageRouter(this.widget) : super(builder: (BuildContext context) => widget);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: widget);
  }

  @override
  Duration get transitionDuration => Duration(seconds: 0);
}