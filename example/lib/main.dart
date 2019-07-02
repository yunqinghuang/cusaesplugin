import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:aesplugin/aesplugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _test_encode = 'Unknown';
  String _test_decode = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String _encode;
    String _decode;
    try {
      _encode = await Aesplugin.aesEncode("测试","10cbced8df7398bc");
      _decode = await Aesplugin.aesDecode(_encode,"10cbced8df7398bc");
    } on PlatformException {
      _encode = 'Failed to get encode.';
      _decode = 'Failed to get decode.' ;
    }

  if (!mounted) return;

    setState(() {
      _test_encode = _encode;
      _test_decode = _decode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child:Column(
          children: <Widget>[
            Text('encode on: $_test_encode\n'),
            Text('decode on: $_test_decode\n'),
          ],
          ),

        ),
      ),
    );
  }
}
