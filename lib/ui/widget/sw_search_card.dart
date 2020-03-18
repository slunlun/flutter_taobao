import 'package:flutter/material.dart';
import 'package:fluttertaobao/ui/theme/taobao_style.dart';

class SWSearchCardWidget extends StatefulWidget {
  final FocusNode focusNode;
  TextEditingController textEditingController;
  final VoidCallback onTap;
  final bool isShowLeading;
  final String hintText;
  final ValueChanged<String> onSubmitted; // 注意onSubmitted，onChanged的类型
  final ValueChanged<String> onChanged;
  final bool autofocus;
  final bool isShowSuffixIcon;
  final double elevation;
  Widget rightWidget;

  SWSearchCardWidget({
    Key key,
    this.focusNode,
    this.textEditingController,
    this.onTap,
    this.isShowLeading = true,
    this.onSubmitted,
    this.onChanged,
    this.autofocus = false,
    this.isShowSuffixIcon = true,
    this.hintText,
    this.elevation = 2.0,
    this.rightWidget,
  }) : super(key: key);

  @override
  _SWSearchCardWidgetState createState() => _SWSearchCardWidgetState();
}

class _SWSearchCardWidgetState extends State<SWSearchCardWidget> {
  String _hintText;
  Widget _rightWidget;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _rightWidget = widget.rightWidget;
    _rightWidget ??= Icon(
      TaoBaoIcons.camera,
      color: Colors.grey,
      size: 20,
    );
    _hintText = widget.hintText;
    _hintText ??= '随机的热搜词';
    if (widget.textEditingController == null) {
      widget.textEditingController = TextEditingController();
    }
    return searchCard();
  }

  Widget searchCard() => Padding(
        padding: EdgeInsets.only(top: 0, right: 0),
        child: Card(
          elevation: widget.elevation, // 这时什么用
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(20.0))), // 用card 是为了设置圆角？
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.isShowLeading
                  ? Padding(
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: Icon(
                        TaoBaoIcons.search_light,
                        color: Colors.grey,
                        size: 20,
                      ),
                    )
                  : SizedBox(
                      width: 10,
                    ),
              Expanded(
                child: Container(
                  height: 34,
                  child: TextField(
                    autofocus: widget.autofocus,
                    onTap: widget.onTap,
                    focusNode: widget.focusNode,
                    style: TextStyle(fontSize: 13),
                    controller: widget.textEditingController,
                    onChanged: widget.onChanged,
                    onSubmitted: widget.onSubmitted,
                    decoration: InputDecoration(
                      // 设置TextField的样式
                      contentPadding:
                          const EdgeInsets.only(top: 2), // 注意这里的contentPadding, 为了对齐搜索图标
                      border: InputBorder.none,
                      hintText: _hintText,
                      suffixIcon: widget.textEditingController.text.length == 0 ||
                              !widget.isShowSuffixIcon
                          ? SizedBox()
                          : Container(
                              width: 20.0,
                              height: 20.0,
                              alignment: Alignment
                                  .centerRight, // 这个centerRight是针对那一层UI来说的呢
                              child: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.grey[500],
                                  size: 16,
                                ),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 6),
                                iconSize: 18,
                                onPressed: (){
                                  setState(() {
                                    widget.textEditingController.text = '';
                                    widget.onChanged('');
                                  });
                                },
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              widget.textEditingController.text.length == 0 ||
                      !widget.isShowSuffixIcon
                  ? Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: _rightWidget,
                    )
                  : SizedBox(), // 只是占个地方，没有大小
            ],
          ),
        ),
      );
}
