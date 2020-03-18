import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertaobao/ui/theme/taobao_style.dart';
import 'package:fluttertaobao/ui/widget/sw_search_card.dart';

class SWTopBar extends StatelessWidget {
  final String hintText;
  TextEditingController _keywordTextEditingController = TextEditingController();
  final FocusNode _focus = new FocusNode();
  SWTopBar({Key key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;  // 获取status bar高度的方法
    return Container(
      color: Theme.of(context).primaryColor,  // 主题颜色
      padding: EdgeInsets.only(top: statusBarHeight, left: 0, right: 0, bottom: 0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 6.0, left: 4.0),
            width: 30,
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  TaoBaoIcons.scan,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: Text(
                    '扫一扫',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

          ),
          Expanded(
            flex: 1,
            child: SWSearchCardWidget(
              elevation: 0,
              onTap: (){

              },
              hintText: hintText,
              textEditingController: _keywordTextEditingController,
              focusNode: _focus,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 6.0, left: 4.0),
            width: 30,
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  TaoBaoIcons.qr_code,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: Text(
                    '会员码',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

          ),
        ],
      ),

    );
  }
}
