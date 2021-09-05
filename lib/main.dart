import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wificonfig/services/wifiprovider.dart';
import 'package:wificonfig/views/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => WifiConfigProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // theme: ThemeData.dark(),
      ),
    );
  }
}
