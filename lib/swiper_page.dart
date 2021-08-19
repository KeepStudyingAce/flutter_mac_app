import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_mac_desktop_demo/common/app_colors.dart';
import 'package:flutter_mac_desktop_demo/common/app_config.dart';
import 'package:flutter_mac_desktop_demo/widgets/self_rect_swiper_pagination_builder.dart';

class SwiperPage extends StatefulWidget {
  SwiperPage({Key? key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

const imageHeight = 200.0;

class _SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swiper"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text("1、方形正常无限循环轮播："),
            SizedBox(height: 10),
            _buildNomarlSwiper(),
            SizedBox(height: 10),
            Text("2、数字标识，Stack切换模式："),
            SizedBox(height: 10),
            _buildStackSwiper(),
            SizedBox(height: 10),
            Text("3、自定义带圆角标识，缩放效果："),
            SizedBox(height: 10),
            _buildScaleSwiper(),
            SizedBox(height: 10),
            Text("4、圆形标识，折叠效果："),
            SizedBox(height: 10),
            _buildTinderSwiper(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildNomarlSwiper() {
    double imageWidth = AppConfig.screenWidth(context);
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(getImgPath("$index.jpg"), fit: BoxFit.cover);
        },
        itemCount: 5,
        containerHeight: imageHeight,
        containerWidth: imageWidth,
        pagination: new SwiperPagination(
          margin: EdgeInsets.only(bottom: 10),
          builder: RectSwiperPaginationBuilder(
            size: Size(16, 3),
            activeSize: Size(16, 3),
            space: 0,
            color: AppColors.inactiveColor,
            activeColor: AppColors.whiteColor,
          ),
        ),
        control: null,
        duration: 1000,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        loop: true,
        onIndexChanged: (index) {
          print("下标：$index");
        },
        onTap: (int index) {
          print("下标：$index");
        },
      ),
    );
  }

  String getImgPath(String name) {
    return 'lib/assets/$name';
  }

  Widget _buildStackSwiper() {
    double imageWidth = AppConfig.screenWidth(context);
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(getImgPath("${7 + index}.jpg"), fit: BoxFit.cover);
        },
        layout: SwiperLayout.STACK,
        itemCount: 5,
        containerHeight: imageHeight,
        containerWidth: imageWidth,
        itemHeight: imageHeight,
        itemWidth: imageWidth,
        pagination: new SwiperPagination(
          margin: EdgeInsets.only(bottom: 10),
          builder: FractionPaginationBuilder(
            color: AppColors.inactiveColor,
            activeColor: AppColors.whiteColor,
          ),
        ),
        control: null,
        duration: 1000,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        viewportFraction: 1,
        scale: 1,
        loop: true,
        onIndexChanged: (index) {
          print("下标：$index");
        },
        onTap: (int index) {
          print("下标：$index");
        },
      ),
    );
  }

  //自定义指示器
  Widget _buildScaleSwiper() {
    double imageWidth = AppConfig.screenWidth(context);
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(getImgPath("${3 + index}.jpg"), fit: BoxFit.cover);
        },
        itemCount: 5,
        containerHeight: imageHeight,
        containerWidth: imageWidth,
        pagination: new SwiperPagination(
          margin: EdgeInsets.only(bottom: 10),
          builder: SelfRectSwiperPaginationBuilder(
            size: Size(16, 3),
            activeSize: Size(16, 3),
            space: 0,
            color: AppColors.inactiveColor,
            activeColor: AppColors.whiteColor,
          ),
        ),
        control: null,
        duration: 1000,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        viewportFraction: 0.7,
        scale: 0.7,
        loop: true,
        onIndexChanged: (index) {
          print("下标：$index");
        },
        onTap: (int index) {
          print("下标：$index");
        },
      ),
    );
  }

  Widget _buildTinderSwiper() {
    double imageWidth = AppConfig.screenWidth(context);
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(getImgPath("${5 + index}.jpg"), fit: BoxFit.cover);
        },
        layout: SwiperLayout.TINDER,
        itemCount: 5,
        containerHeight: imageHeight,
        containerWidth: imageWidth,
        itemHeight: imageHeight,
        itemWidth: imageWidth,
        pagination: new SwiperPagination(
          margin: EdgeInsets.only(bottom: 10),
          builder: DotSwiperPaginationBuilder(
            activeSize: 10,
            space: 2,
            color: AppColors.inactiveColor,
            activeColor: AppColors.whiteColor,
          ),
        ),
        control: null,
        duration: 1000,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        loop: true,
        onIndexChanged: (index) {
          print("下标：$index");
        },
        onTap: (int index) {
          print("下标：$index");
        },
      ),
    );
  }
}
