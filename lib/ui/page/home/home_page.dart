import 'package:flutter/material.dart';
import 'package:fluttertaobao/ui/theme/taobao_style.dart';
import 'package:fluttertaobao/ui/widget/sw_topbar.dart';

class HomePage extends StatelessWidget {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: TaoBaoColors.mainBackgroundColor,
      appBar: PreferredSize( // PreferredSize 用来将appBar完全隐去
          child: AppBar(
            brightness: Brightness.dark,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(0)),
      body: Column(
        children: <Widget>[
          SWTopBar(hintText: '宜家拉斯科推车'),
        ],
      ),
    );
  }
}
