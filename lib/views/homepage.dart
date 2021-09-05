import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:wificonfig/services/wifiprovider.dart';
import 'package:wificonfig/views/abcview.dart';
import 'package:wificonfig/views/wificonfig.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wifiProvider = Provider.of<WifiConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Provider(
        create: (context) => WifiConfigProvider(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: InkWell(
              onTap: () {
                wifiProvider.getData();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Abc(
                              wifiConfigProvider: wifiProvider,
                            )));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(7)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.settings_input_antenna),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Wifi Config"),
                        ],
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
