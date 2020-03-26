import 'package:flutter/material.dart';
import 'package:fluttertaobao/common/model/tab.dart';

class SWTabBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final List<TabModel> tabModels;
  final TabController tabController;
  final int currentIndex;
  const SWTabBarWidget(
      {Key key, this.tabModels, this.tabController, this.currentIndex})
      : super(key: key);

  @override
  _SWTabBarWidgetState createState() => _SWTabBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(30);
}

class _SWTabBarWidgetState extends State<SWTabBarWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: widget.tabController,
        indicatorColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label, // 这个是什么size
        isScrollable: true, // 注意，默认是false
        unselectedLabelColor: Colors.black,
        labelColor: Color(0xFFfe5100),
        labelPadding: EdgeInsets.only(right: 5.0, left: 5.0),
        onTap: (i) {
          _selectedIndex = i;
          setState(() {
          });
        },
        tabs: widget.tabModels.map((i) => Container(
          padding: EdgeInsets.all(0.0),
          child: Tab(
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 3,
                    ),
                    Text(i.title),
                    SizedBox(
                      height: 3,
                    ),
                    widget.tabModels.indexOf(i) == widget.currentIndex
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        color: Color(0xFFfe5100),
                        child: Text(
                          i.subtitle,
                          style: TextStyle(
                              fontSize: 9, color: Colors.white),
                        ),
                      ),
                    )
                        : Expanded(
                      child: Text(
                        i.subtitle,
                        style: TextStyle(
                            fontSize: 9,
                            color: Color(0xFFb5b6b5)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Color(0xFFc9c9ca),
                ),
              ],
            ),
          ),
        )).toList(),
      ),
    );
  }
}
