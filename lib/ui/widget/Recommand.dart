import 'package:flutter/material.dart';
import 'package:fluttertaobao/common/model/command.dart';
import 'package:fluttertaobao/ui/page/weitao/weitao_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertaobao/common/utils/common_utils.dart';

class RecommendFlow extends StatelessWidget {
  final CommandItemList commendData;

  RecommendFlow({this.commendData});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;  // 这里的MediaQuery 注意
    return Container(
      child: _buildCommandCards(deviceWidth),
    );
  }

  Widget _buildCommandCards(double deviceWidth) {
    deviceWidth -= 28;
    double itemWidth = deviceWidth / 4;
    double imageWidth = deviceWidth / 4;;
    List<Widget> widgetList = commendData.list.map((i){
      var bgColor = CommonUtils.string2Color(i.bgColor);
      Color titleColor = CommonUtils.string2Color(i.titleColor);
      Color subtitleColor = CommonUtils.string2Color(i.subtitleColor);
      return Container(
          width: itemWidth,
//          margin: EdgeInsets.only(bottom: 5, left: 2),
          padding: EdgeInsets.only(top: 8, left: 3, bottom: 7, right: 3),
//          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
//              SizedBox(height: 10,),
              Container(
                height: 25,
                child: Text(
                  i.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: titleColor),
                ),
              ),
              new ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: bgColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        i.subtitle,
                        maxLines: 1,
//                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: subtitleColor, fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      Container(
                        alignment: Alignment(0, 0),
                        margin: EdgeInsets.only(top: 5),
                        child: CachedNetworkImage(
                          imageUrl: i.picUrl,
                          width: imageWidth,
                          height: imageWidth + 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ));
    }).toList();

    return Wrap(
      spacing: 0,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: widgetList,
    );
  }
}