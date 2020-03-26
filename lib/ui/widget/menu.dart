import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertaobao/common/utils/screen_util.dart';

class HomeKingKongWidget extends StatelessWidget {
  final List data;
  final String bgurl;
  final String fontColor;

  HomeKingKongWidget({this.data, this.bgurl, this.fontColor});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: ScreenUtil().L(80),
      width: deviceWidth,
      child: _buildRow(),
    );
  }

  Row _buildRow() {
    var colorInt = int.parse(fontColor.replaceAll('#', '0x'));
    Color color = new Color(colorInt).withOpacity(1.0);
    double iconWidth = ScreenUtil().L(58);
    double iconHeight = ScreenUtil().L(47);
    List widgets = data.map((i) {
      return Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CachedNetworkImage(
            width: iconWidth,
            height: iconHeight,
            imageUrl: i.picUrl,
//            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
          Text(
            i.title,
            style: TextStyle(
                fontSize: 13.0,
                height: 1.5,
                decoration: TextDecoration.none,
                color: color),
          ),
        ],
      ));
    }).toList();
    return Row(
      children: widgets,
    );
  }
}
