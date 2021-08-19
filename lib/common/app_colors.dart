import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  // 透明
  static const Color transparent = Colors.transparent;
  // 默认页面背景色
  static const Color background = Color(0xFFF7F7F7);
  // 默认阴影颜色
  static const Color shadowColor = Color(0x0C000000);
  // 主题颜色
  static const Color themeColor = Color(0xFFBF9264);
  // 分割线颜色
  static const Color separatorColor = Color(0x20000000);
  // 文本样式
  static const Color subTextColor = Color(0xFF666666);
  // 白色
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color white50Color = Color(0x80FFFFFF);
  // 红色
  static const Color redColor = Color(0xFFFF0000);
  static const Color red50Color = Color(0xFF800000);
  // 绿色
  static const Color greenColor = Color(0xFF00FF00);
  static const Color tencentGreenColor = Color(0xFF00A66B);

  // 黑色
  static const Color blackColor = Color(0xFF000000);
  static const Color black50Color = Color(0x80000000);
  static const Color black30Color = Color(0x4C000000);
  // 轮播图未选中颜色
  static const Color inactiveColor = Color(0x99FFFFFF);

  //根据Color返回正确的MaterialColor
  static MaterialColor getMaterialColorFrom(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  // 随机颜色
  static getRandomColor() {
    Random t = Random();
    int r = t.nextInt(255);
    int g = t.nextInt(255);
    int b = t.nextInt(255);
    return Color.fromARGB(255, r, g, b);
  }
}

class CommonFont {
  /// AppBar标题颜色
  static const appBarTitleSize = 18.0;

  /// 常见字体大小
  static const normalTitleSize = 12.0;

  /// 常规体
  static const fontWeightRegular = FontWeight.normal;

  /// 粗体
  static const fontWeightBold = FontWeight.bold;

  /// 中粗体
  static const fontWeightMiddle = FontWeight.w500;

  /// tabBar专用中粗体
  static final tabBarFontWeightMiddle =
      Platform.isIOS ? FontWeight.w500 : FontWeight.w600;
}
