import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
            '我的'
        ),
      ),
    );
  }
}