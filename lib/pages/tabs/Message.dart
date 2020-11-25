import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  //轮播图
  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];

    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                imgList[index]["url"],
                fit: BoxFit.fill,
              );
            },
            itemCount: imgList.length,
            pagination: new SwiperPagination(),
            autoplay: true),
      ),
    );
  }

  Widget _titleWidget(value) {
    return Container(
      height: ScreenUtil().setHeight(32),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
        color: Colors.red,
        width: ScreenUtil().setWidth(10),
      ))),
      child: Text(
        value,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // ScreenUtil.init(context,designSize: Size(750, 1334), allowFontScaling: false);

    return ListView(
      children: <Widget>[
        _swiperWidget(),
        SizedBox(height: 10),
        _titleWidget("猜你喜欢"),
        SizedBox(height: 10),
        _titleWidget("热门推荐"),
      ],
    );
  }
}
