import 'package:flutter/material.dart';
import 'package:fluttertaobao/ui/page/home/home_page.dart';
import 'package:fluttertaobao/ui/page/weitao/weitao_page.dart';
import 'package:fluttertaobao/ui/page/message/message_page.dart';
import 'package:fluttertaobao/ui/page/shopping_cart/shopping_cart_page.dart';
import 'package:fluttertaobao/ui/page/mine/mine_page.dart';
import 'package:fluttertaobao/common/common_define.dart';
import 'package:fluttertaobao/ui/theme/taobao_style.dart';
import 'package:fluttertaobao/ui/page/home/home_page.dart';
import 'package:fluttertaobao/ui/page/message/message_page.dart';
import 'package:fluttertaobao/ui/page/weitao/weitao_page.dart';
import 'package:fluttertaobao/ui/page/shopping_cart/shopping_cart_page.dart';
import 'package:fluttertaobao/ui/page/mine/mine_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: TaoBaoColors.primarySwatch,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              TaoBaoIcons.home,
//              Icons.message,
              color: _currentIndex == 0 ? _bottomNavigationActiveColor : _bottomNavigationColor,
            ),
            activeIcon: Icon(
              TaoBaoIcons.home_active,
              color: _currentIndex == 0 ? _bottomNavigationActiveColor : _bottomNavigationColor,
              size: 34,
            ),
            title: _currentIndex == 0 ? Container() : _buildBarItemTitle('首页', 0)),
        BottomNavigationBarItem(
            icon: Icon(
              TaoBaoIcons.we_tao,
//                Icons.message,
              color: _currentIndex == 1 ? _bottomNavigationActiveColor : _bottomNavigationColor,
            ),
            activeIcon: Icon(
              TaoBaoIcons.we_tao_active,
              color: _currentIndex == 1 ? _bottomNavigationActiveColor : _bottomNavigationColor,
            ),
            title: _buildBarItemTitle('微淘', 1)),
        BottomNavigationBarItem(
            icon: Icon(
              TaoBaoIcons.message,
//                Icons.message,
              color: _currentIndex == 2 ? _bottomNavigationActiveColor : _bottomNavigationColor,
            ),
            activeIcon: Icon(
              TaoBaoIcons.message_active,
              color: _currentIndex == 2 ? _bottomNavigationActiveColor : _bottomNavigationColor,
            ),
            title: _buildBarItemTitle('消息', 2)),
        BottomNavigationBarItem(
            icon: Icon(
              TaoBaoIcons.cart,
//                Icons.message,
              color: _currentIndex == 3 ? _bottomNavigationActiveColor : _bottomNavigationColor,
            ),
            activeIcon: Icon(
              TaoBaoIcons.cart_active,
              color: _currentIndex == 3 ? _bottomNavigationActiveColor : _bottomNavigationColor,
            ),
            title: _buildBarItemTitle('购物车', 3)),
        BottomNavigationBarItem(
            icon: Icon(
              TaoBaoIcons.mine,
//                Icons.message,
              color: _currentIndex == 4 ? _bottomNavigationActiveColor : _bottomNavigationColor,
            ),
            activeIcon: Icon(
              TaoBaoIcons.mine_active,
              color: _currentIndex == 4 ? _bottomNavigationActiveColor : _bottomNavigationColor,
            ),
            title: _buildBarItemTitle('我的淘宝', 4)),
      ],
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildBarItemTitle(String text, int index) {
    return Text(
      text,
      style: TextStyle(
          color: _currentIndex == index ? _bottomNavigationActiveColor : _bottomNavigationColor, fontSize: 12),
    );
  }

  final _bottomNavigationColor = Color(0xFF585858);
  Color _bottomNavigationActiveColor = Colors.blue;




  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        {
          return new HomePage();
        }
        break;
      case 1:
        {
          return new WeiTaoPage();
        }
        break;
      case 2:
        {
          return new MessagePage();
        }
        break;
      case 3:
        {
          return new CartPage();
        }
        break;
      case 4:
        {
          return new MinePage();
        }
        break;
      default:
        break;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    _bottomNavigationActiveColor = Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
