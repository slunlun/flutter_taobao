import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
            '首页'
        ),
      ),
    );
  }
}