import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertaobao/ui/theme/taobao_style.dart';
import 'package:fluttertaobao/ui/widget/sw_topbar.dart';
import 'package:fluttertaobao/common/utils/screen_util.dart';
import 'package:fluttertaobao/ui/widget/sw_tabbar.dart';
import 'package:fluttertaobao/common/model/tab.dart';
import 'package:fluttertaobao/common/data/home.dart';
import 'package:fluttertaobao/ui/tools/arc_clipper.dart';
import 'package:fluttertaobao/common/model/kingkong.dart';
import 'package:fluttertaobao/ui/widget/menu.dart';
import 'package:fluttertaobao/ui/widget/Recommand.dart';
import 'package:fluttertaobao/common/model/command.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<HomePage> {

  List<TabModel> _tabModels = [];
  TabController _tabController;
  int _currentIndex = 0;
  List<KingKongItem> kingKongItems;


  ScrollController _scrollViewController;
  Size _sizeRed;

  GlobalKey _keyFilter = GlobalKey();
  _afterLayout(_) {
    _getPositions('_keyFilter', _keyFilter);
    _getSizes('_keyFilter', _keyFilter);

//    _getPositions('_keyDropDownItem', _keyDropDownItem);
//    _getSizes('_keyDropDownItem', _keyDropDownItem);
  }

  _getPositions(log, GlobalKey globalKey) {
    RenderBox renderBoxRed = globalKey.currentContext.findRenderObject();
    var positionRed = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of $log: $positionRed ");
  }

  _getSizes(log, GlobalKey globalKey) {
    RenderBox renderBoxRed = globalKey.currentContext.findRenderObject();
    _sizeRed = renderBoxRed.size;
    setState(() {});
    print("SIZE of $log: $_sizeRed");
  }

  // implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

//    WidgetsBinding.instance.addPostFrameCallback((_){
//      RenderBox renderBoxRed = context.findRenderObject();
//      _sizeRed = renderBoxRed.size;
//      setState(() {});
//    });  这里如果直接使用context的话，只能够获得当前可视部分的size。需要通过globalKey获取真正的size！

    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);

    kingKongItems = KingKongList.fromJson(menuDataJson['items']).items;

    _tabModels.add(TabModel(title: '全部', subtitle: '猜你喜欢'));
    _tabModels.add(TabModel(title: '直播', subtitle: '网红推荐'));
    _tabModels.add(TabModel(title: '便宜好货', subtitle: '低价抢购'));
    _tabModels.add(TabModel(title: '买家秀', subtitle: '购后分享'));
    _tabModels.add(TabModel(title: '全球', subtitle: '进口好货'));
    _tabModels.add(TabModel(title: '生活', subtitle: '享受生活'));
    _tabModels.add(TabModel(title: '母婴', subtitle: '母婴大赏'));
    _tabModels.add(TabModel(title: '时尚', subtitle: '时尚好货'));

    _tabController = TabController(vsync: this, length: 8);
    _tabController.addListener(_handleTabSelection);

    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var v = Column(
      children: <Widget>[
        _buildSwiperImageWidget(),
        _buildSwiperButtonWidget(),
        _buildRecommendedCard(),
      ],
    );

    var body= NestedScrollView(
      controller: _scrollViewController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            forceElevated: boxIsScrolled,
            backgroundColor: TaoBaoColors.mainBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Column(  // 这个background 是什么意思
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[v],
              ),
            ),
            expandedHeight: _sizeRed.height + 50.0, // 这里_sizeRed 一直会为null？因为build的时机要早于回调
            bottom: PreferredSize(  // PreferredSize 是做什么?
              preferredSize: Size(double.infinity, 48),
              child: SWTabBarWidget(
                tabController: _tabController,
                tabModels: _tabModels,
                currentIndex: _currentIndex,
              ),
            ),
          ),
        ];
      },
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

    return new Scaffold(
      backgroundColor: TaoBaoColors.mainBackgroundColor,
      appBar: PreferredSize( // PreferredSize 用来将appBar完全隐去
          child: AppBar(
            brightness: Brightness.dark,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(0)),
      body: Column(
        children: <Widget>[
          Offstage(  // 这个offstage很重要，用key: _keyFilter来获取home内容的整体高度_sizeRed，使之可以折叠
            offstage: true,
            child: Container(
              child: v,
              key: _keyFilter,
            ),
          ),
          SWTopBar(hintText: '宜家拉斯科推车'),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }



  Widget _buildSwiperImageWidget() {
    return Container(
      height: 150,
      child: Swiper(
        /// 初始的时候下标位置
        index: 0,
        /// 无限轮播模式开关
        loop: true,
        /// 设置 new SwiperPagination() 展示默认分页指示器
        pagination: SwiperPagination(),
        duration: 300,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        itemCount: bannerImages.length,
        onTap: (i) {

        },
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            child: ClipPath(
              clipper: ArcClipper(),
              child: Container(
                height: 150,
                child: CachedNetworkImage(
                  fadeOutDuration: const Duration(milliseconds: 300),
                  fadeInDuration: const Duration(milliseconds: 700),
                  fit: BoxFit.fill,
                  imageUrl: bannerImages[index],
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSwiperButtonWidget() {
    return Container(
      height: ScreenUtil().L(80) * 2 + 30,
      child: Swiper(
        index: 0,
        autoplay: false,
        loop: true,
        itemCount: (kingKongItems.length ~/ 10) + (kingKongItems.length % 10 > 0 ? 1:0),
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: RectSwiperPaginationBuilder(
            color: Color(0xFFd3d7de),
            activeColor: Theme.of(context).primaryColor,
            size: Size(18, 3),
            activeSize: Size(18, 3),
            space: 0,
          ),
        ),
        duration: 300,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          List data = [];
          for (var i = (index * 2) * 5; i < (index * 2) * 5 + 5; ++i) {
            //0-4,5-9,10-14,15-19
            if (i >= kingKongItems.length) {
              break;
            }
            data.add(kingKongItems[i]);
          }
          List data1 = [];
          for (var i = (index * 2 + 1) * 5; i < (index * 2 + 1) * 5 + 5; ++i) {
            //0-4,5-9,10-14,15-19
            if (i >= kingKongItems.length) {
              break;
            }
            data1.add(kingKongItems[i]);
          }

          return Column(
            children: <Widget>[
              HomeKingKongWidget(
                data: data,
                fontColor: (menuDataJson['config'] as dynamic)['color'],
                bgurl: (menuDataJson['config'] as dynamic)['pic_url'],
              ),
              HomeKingKongWidget(
                data: data1,
                fontColor: (menuDataJson['config'] as dynamic)['color'],
                bgurl: (menuDataJson['config'] as dynamic)['pic_url'],
              ),
            ],
          );
        },

      ),
    );
  }

  Widget _buildRecommendedCard() {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Card(
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  RecommendFlow(commendData: CommandItemList.fromJson(recommendJson)),
                ],
              ),
              Container(
                width: ScreenUtil.screenWidth,
                height: 0.6,
                color: TaoBaoColors.mainBackgroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleTabSelection() {
    print('_handleTabSelection:${_tabController.index}');
    setState(() {
      _currentIndex = _tabController.index;
    });
  }


}
