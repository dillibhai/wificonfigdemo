import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wificonfig/services/wifiprovider.dart';

class Abc extends StatefulWidget {
  const Abc({
    Key? key,
    required this.wifiConfigProvider,
  }) : super(key: key);
  final WifiConfigProvider wifiConfigProvider;

  @override
  _AbcState createState() => _AbcState();
}

class _AbcState extends State<Abc> {
  @override
  Widget build(BuildContext context) {
    final wifiProvider = Provider.of<WifiConfigProvider>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Provider(
                  create: (context) => WifiConfigProvider(),
                  child: Column(children: [Text(wifiProvider.message)])),
            )));
  }
}
