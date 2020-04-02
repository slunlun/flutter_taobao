import 'package:flutter/material.dart';
import 'package:fluttertaobao/common/data/home.dart';
import 'package:fluttertaobao/ui/theme/taobao_style.dart';

class SearchSuggestionPage extends StatefulWidget {
  @override
  _SearchSuggestionPageState createState() => _SearchSuggestionPageState();
}

class _SearchSuggestionPageState extends State<SearchSuggestionPage> {
  bool _isHideSearchFind = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '历史搜索',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              Icon(
                Icons.delete_outline,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: searchRecordTexts
                .map((i) => GestureDetector(
                      onTap: () {
                        // NavigatorUtils.gotoSearchGoodsResultPage(context, i);
                      },
                      child: Container(
                        decoration: BoxDecoration(color: Color(0xFFf7f8f7), borderRadius: BorderRadius.circular(13)),
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(i,  style: TextStyle(color: Color(0xFF565757), fontSize: 13)),
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '搜索发现',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isHideSearchFind = !_isHideSearchFind;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: Icon(
                    _isHideSearchFind ? TaoBaoIcons.attention_forbid : TaoBaoIcons.attention_light,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          Offstage(
            offstage: !_isHideSearchFind,
            child: Center(
              child: Text(
                '当前搜索发现已隐藏',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
