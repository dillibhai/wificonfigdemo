import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wificonfig/services/wifiprovider.dart';

class WifiConfig extends StatefulWidget {
  const WifiConfig({Key? key}) : super(key: key);

  @override
  _WifiConfigState createState() => _WifiConfigState();
}

class _WifiConfigState extends State<WifiConfig> {
  String? valuechoose;
  List<String> listItem = [
    "World link Communication 1",
    "World link Communication 2",
    "World link Communication 3",
    "World link Communication 4"
  ];
  @override
  Widget build(BuildContext context) {
    final wifiProvider = Provider.of<WifiConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Provider(
          create: (context) => WifiConfigProvider(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: DropdownButton(
                        isExpanded: true,
                        value: valuechoose,
                        dropdownColor: Colors.black54,
                        underline: SizedBox(),
                        hint: Icon(Icons.settings_input_antenna,
                            size: 20, color: Colors.white),
                        onChanged: (newvalue) {
                          setState(() {
                            valuechoose = newvalue as String;
                          });
                        },
                        items: listItem.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList()),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      initialValue: wifiProvider.username,
                      decoration: InputDecoration(
                        enabled: false,
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      initialValue: wifiProvider.responseData.toString(),
                      decoration: InputDecoration(
                        // hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: 50,
                    width: double.infinity,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Update')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
