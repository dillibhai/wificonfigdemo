import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wificonfig/model/configmodel.dart';
import 'package:http/http.dart' as http;

class WifiConfigProvider with ChangeNotifier {
  DataModel responseData = DataModel(stbs: []);
  String username = '';
  int resellerId = 0;
  var message = '';
  String serial = '';
  String ssid = '';
  String password = '';
  String url = 'resources.geniustv.dev.geniussystems.com.np';
  String token =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjhkZWQ2NWFkZGFlZmVhNjYzNGE5OTAzYTAyZGRhNmYwZGU4ZDNkOGI3OTMwOGY2ZmEzMGYzM2Q2NzE2ZDNkMTc3N2VlNDQ5OTRkZTIyYjU4In0.eyJhdWQiOiI2IiwianRpIjoiOGRlZDY1YWRkYWVmZWE2NjM0YTk5MDNhMDJkZGE2ZjBkZThkM2Q4Yjc5MzA4ZjZmYTMwZjMzZDY3MTZkM2QxNzc3ZWU0NDk5NGRlMjJiNTgiLCJpYXQiOjE2MzA4MTQ4NzMsIm5iZiI6MTYzMDgxNDg3MywiZXhwIjoxNjMwODIzNTEzLCJzdWIiOiIxNzM1MTIiLCJzY29wZXMiOlsic3Vic2NyaWJlciJdLCJwYXJhbXMiOnsiaWQiOjE3MzUxMiwicmVzZWxsZXJfaWQiOjUsInVzZXJuYW1lIjoibmlyb2ptYWhhcmphbjIwNTAiLCJzZXJpYWwiOiJuaXJvam1haGFyamFuMjA1MC01Iiwic2Vzc2lvbiI6InI6MzMyN2E4MjIyODNjNjc5ZDBkODNiOTYxM2Y0NmYxNWMiLCJyZXNlbGxlciI6IndvcmxkbGluayIsImV4cGlyeV9kYXRlIjoiMjAyNS0wMS0xMSAwMDowMDowMCIsImNvbnRlbnRfZXhwaXJ5IjoiMCIsImF1dGhfbW9kZSI6InVzZXIiLCJyZXF1ZXN0ZWRfdXNlciI6bnVsbCwic2Vzc2lvbl9pZCI6ODI3NjE1LCJkZXRhaWxzIjoiMTczNTEyLTI5NTk2OSJ9fQ.TsjtbxkeCHJjTLYyFypLT6FfBKD-g9B3XXLdoNJMCF21tGhvcIbAp90dHkjleCBRvdZIkrgmqAst8BGxzeLpktd6GONBO9-uuINXN_0KI9kH7kOxsw8GS-TrgVCYWmVuEw-rWbeyyG59_Z3wCLnZb8-h59RDz7i1QmyqUPhSyNDY0z78ILjz4DkmLHHwGeEJ4uO0AZj8dd81-kd-SUkCpwDFtIa8cIG7crmvbBdbALj-e02isEjTZ8HlVPZLhGAHOZbc7pYG5pJbivI0uaUJIQOs1fe-cZdJ4iuOm06BQ1u2uRufSEcGWk90F-uev5uATFg0JJAfHCbu3oOpMbjIT2JZY5HA5i87sv2cp-eSdHrcM170TK4TewQ5FzzTcqz4legM_kYRPsOtmjpgbQVdLO-Bu8tB4DpwcNFv-jDCntNswf1PL5AlO7Nw16tAweM6K6uGtVOgZZI36UniFNGBFZliz1sL1yEHmKrDtimGPqZ_84NOa3re39y10MWl4sGRJhX7mYrXAk1Vqf0wtg61CIrSrM3lJhfZoVQPK4ZxzCqRpjjUQWMPjG4vhO_E53guKQehIGuASGqycmXREGbdcnXjRVkLIVaKziClDcAjy2WaVaH4KQJQu0MP0YsvIU1sSnTh9HNe4WAGh1s8lXVwQ4ukBEb5wbYTAdB35n0E_0M";
  Future<List<DataModel?>> getData() async {
    Map<String, String> headers = Map();
    headers["content-type"] = "application/json";
    headers["Accept"] = "application/json";
    headers["Authorization"] = token;
    var response = await http.get(
        Uri.https(url, '/resellers/subscriber/173512/hotspot-stats'),
        headers: headers);
    var wificonfig;

    wificonfig = jsonDecode(response.body);
    var data = dataModelFromJson(jsonEncode(wificonfig));
    print(data.toString());
    if (response.statusCode == 200) {
      print(message);
    } else {
      print("Something went wrong");
    }
    return data;
  }
}
