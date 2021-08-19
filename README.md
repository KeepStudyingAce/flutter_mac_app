# Flutter Mac桌面端应用demo

Flutter2.0支持桌面和web了，之前尝试过web应用，新建web以及现有的App修改后运行到web，现在简单了解一下mac桌面应用的使用

## 步骤：
分支默认是关闭桌面应用的，使用下面的命令开启：
        
    flutter config --enable-macos-desktop
    flutter config --enable-linux-desktop
    flutter config --enable-windows-desktop
查看本地的桌面模拟器

    flutter devices

创建带Mac桌面应用的工程

    flutter create -d macos hello_desktop_demo

运行

    flutter run -d macos


发布平台包

    flutter build macos
    flutter build linux
    flutter build windows

build之后的包在build/macos/Products/Release目录下
直接.app后缀名的可以本地打开

简易demo操作成功

## 常见错误

1、部分库不支持null-safety版本，运行后会报错如下：

Flutter--Error: Cannot run with sound null safety, because the following dependencies don't support null safety:

Error: Cannot run with sound null safety, because the following dependencies
don't support null safety:
flutter sdk提示不是支持 null safety模式

解决方法：

    flutter run --no-sound-null-safety -d macos

    flutter build macos --no-sound-null-safety