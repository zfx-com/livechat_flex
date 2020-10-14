# 💬 livechat_flex

![CI](https://github.com/zfx-com/livechat_flex/workflows/CI/badge.svg?style=flat-square)
[![license](https://img.shields.io/badge/license-MIT-success.svg?style=flat-square)](https://github.com/zfx-com/livechat_flex/blob/master/LICENSE)

A livechat_flex package for embedding mobile chat window in your mobile application while giving you a chance not to provide visitor name and email.

## Installing

```yaml
dependencies:
  livechat_flex: "^0.0.1"
```

### ⚡️ Import

```dart
import 'package:livechat_flex/livechat_flex.dart';
```

## 🎮 How To Use

> Get the [Crendentials](https://www.livechat.com) for your LiveChat 

### Android
>- Edit AndroidManifest.xml as shown below

#### Internet and Storage Access
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

#### ChatWindow
```xml
<activity android:name="com.livechatinc.inappchat.ChatWindowActivity" android:configChanges="orientation|screenSize" />
```

### Dart Usage

```dart
onPressed: (){
    Livechat.beginChat(LICENSE_NO, GROUP_ID, VISITOR_NAME, VISITOR_EMAIL);
    },
```

For more info, please, refer to the `main.dart` in the example.

### Views

<img src="https://github.com/zfx-com/livechat_flex/raw/master/assets/1.png" width="250"><img src="https://github.com/zfx-com/livechat_flex/raw/master/assets/2.png" width="250">

## 🐛 Bugs/Requests

If you encounter any problems feel free to open an issue. If you feel the library is
missing a feature, please raise a ticket on Github and I'll look into it.
Pull request are also welcome.

## ❗️ Note

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## 🤓 Developer(s)


## ⭐️ License

#### <a href="https://github.com/zfx-com/livechat_flex/blob/master/LICENSE">MIT LICENSE</a>