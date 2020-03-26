import 'package:flutter/material.dart';

class CommandItemModel {
  String jumpUrl;
  String bgColor;
  String picUrl;
  String title;
  String titleColor;
  String subtitle;
  String subtitleColor;
  CommandItemModel(
      {this.jumpUrl,
      this.bgColor,
      this.picUrl,
      this.title,
      this.titleColor,
      this.subtitle,
      this.subtitleColor});

  factory CommandItemModel.fromJson(Map<String, dynamic> json){
    return CommandItemModel(
        bgColor: json['bg_color'],
        jumpUrl: json['jump_url'],
        picUrl: json['pic_url'],
        subtitle: json['subtitle'],
        titleColor: json['title_color'],
        subtitleColor: json['subtitle_color'],
        title: json['title']
    );
  }
}

class CommandItemList {
  List<CommandItemModel> list;
  String title;
  CommandItemList({this.title, this.list});

  factory CommandItemList.fromJson(Map<String, dynamic> json){
    var itemList = json['items'] as List;
    var itemModelList = itemList.map((i){
      return CommandItemModel.fromJson(i);
    }).toList();
    return CommandItemList(list: itemModelList, title: json['title']);
  }

}

