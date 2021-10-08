import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:livechat_flex/livechat_flex.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final licenseNoTextController = TextEditingController();
  final groupIdTextController = TextEditingController();
  final visitorNameTextController = TextEditingController();
  final visitorEmailTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await LivechatFlex.platformVersion;
    } on PlatformException {
      debugPrint('Failed to get platform version.');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Live Chat Plugin example app'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "License Nnumber",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: licenseNoTextController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Group ID",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: groupIdTextController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " Visitor Name",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: visitorNameTextController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Visitor Email",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: visitorEmailTextController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          LivechatFlex.startChat(licenseNoTextController.text,
                              groupIdTextController.text,
                              visitorName: visitorNameTextController.text,
                              visitorEmail: visitorEmailTextController.text);
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: Text(
                          "Start Live Chat",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
