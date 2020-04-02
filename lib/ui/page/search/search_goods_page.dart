import 'package:flutter/material.dart';
import 'package:fluttertaobao/ui/theme/taobao_style.dart';
import 'package:fluttertaobao/ui/widget/sw_search_card.dart';
import 'package:fluttertaobao/common/utils/navigator_util.dart';
import 'package:fluttertaobao/ui/page/search/search_associate_list_widget.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertaobao/common/services/search.dart';
import 'package:fluttertaobao/ui/page/search/search_suggestion_page.dart';


class SearchGoodsPage extends StatefulWidget {
  final String keyWords;
  SearchGoodsPage({Key key, this.keyWords}) : super(key: key);

  @override
  _SearchGoodsPageState createState() => _SearchGoodsPageState();
}

class _SearchGoodsPageState extends State<SearchGoodsPage> {
  List _tabsTitle = ['全部', '天猫', '店铺'];
  List<String> recommendWords = [];
  TextEditingController _keywordsTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _keywordsTextEditingController.text = widget.keyWords;
    if (widget.keyWords != null) {
      seachTxtChanged(widget.keyWords);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaoBaoColors.mainBackgroundColor,
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: TaoBaoColors.mainBackgroundColor,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0), // 这里fromHeight的用途???
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: SWSearchCardWidget(
                    elevation: 0,
                    autofocus: true,
                    textEditingController: _keywordsTextEditingController,
                    isShowLeading: false,
                    onSubmitted: (value) {
                      NavigatorUtils.gotoSearchGoodsResultPage(context, value);
                    },
                    onChanged: (value) {
                      seachTxtChanged(value);
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    // 这里注意，单纯没有child的Container，不会响应tap事件
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      '取消',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: recommendWords.length == 0 ? _buildContentWedgit() : SearchAssociateListWidget(items: recommendWords,
              onItemTap: (value){
                NavigatorUtils.gotoSearchGoodsResultPage(context, value);
              },),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentWedgit() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        TabBar(
            indicatorColor: Color(0xFFfe5100),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: Color(0xFFfe5100),
            unselectedLabelColor: Colors.black,
            labelPadding: EdgeInsets.only(left: 40, right: 40),
            labelStyle: TextStyle(fontSize: 12),
            onTap: (i) {
            },
            tabs: _tabsTitle
                .map((i) => Text(
              i,
              style: TextStyle(fontSize: 15),
            ))
                .toList()),
        SizedBox(
          height: 8,
        ),
        Expanded(
            child: TabBarView(
              children: <Widget>[
                SearchSuggestionPage(),
                SearchSuggestionPage(),
                SearchSuggestionPage(),
              ],
            ))
      ],
    );
  }
  void seachTxtChanged(String q) async {
    var result = await getSuggest(q) as List;
    recommendWords = result.map((dynamic i) {
      List item = i as List;
      return item[0] as String;
    }).toList();
    setState(() {

    });
  }
}
