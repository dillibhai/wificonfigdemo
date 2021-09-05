// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

// List<DataModel> dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

List<DataModel> dataModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.stbs,
  });

  List<Stb> stbs;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        stbs: List<Stb>.from(json["stbs"].map((x) => Stb.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stbs": List<dynamic>.from(stbs.map((x) => x.toJson())),
      };
  @override
  String toString() {
    return "DataModel(stbs: $stbs)";
  }
}

class Stb {
  Stb({
    required this.id,
    required this.mac,
    required this.serial,
    required this.vendor,
    required this.model,
    required this.osVersion,
    required this.owner,
    required this.batchNo,
    required this.status,
    required this.webUser,
    required this.createdAt,
    required this.updatedAt,
    required this.ssidDetails,
    required this.hotspotStat,
  });

  int id;
  String mac;
  String serial;
  int vendor;
  int model;
  String osVersion;
  int owner;
  int batchNo;
  String status;
  String webUser;
  DateTime createdAt;
  DateTime updatedAt;
  SsidDetails ssidDetails;
  HotspotStat hotspotStat;

  factory Stb.fromJson(Map<String, dynamic> json) => Stb(
        id: json["id"],
        mac: json["mac"],
        serial: json["serial"],
        vendor: json["vendor"],
        model: json["model"],
        osVersion: json["os_version"],
        owner: json["owner"],
        batchNo: json["batch_no"],
        status: json["status"],
        webUser: json["web_user"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        ssidDetails: SsidDetails.fromJson(json["ssid_details"]),
        hotspotStat: HotspotStat.fromJson(json["hotspot_stat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mac": mac,
        "serial": serial,
        "vendor": vendor,
        "model": model,
        "os_version": osVersion,
        "owner": owner,
        "batch_no": batchNo,
        "status": status,
        "web_user": webUser,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "ssid_details": ssidDetails.toJson(),
        "hotspot_stat": hotspotStat.toJson(),
      };
  @override
  String toString() {
    return "DataModel(id: $id,mac: $mac,serial: $serial,vendor,id: $id: $vendor,model: $model,osVersion: $osVersion,owner: $owner,batchNo: $batchNo,status: $status,webUser: $webUser,createdAt: $createdAt,updatedAt: $updatedAt,ssidDetails: $ssidDetails,hotspotStat: $hotspotStat,)";
  }
}

class HotspotStat {
  HotspotStat({
    required this.expiryDate,
    required this.isExpired,
  });

  DateTime expiryDate;
  int isExpired;

  factory HotspotStat.fromJson(Map<String, dynamic> json) => HotspotStat(
        expiryDate: DateTime.parse(json["expiry_date"]),
        isExpired: json["is_expired"],
      );

  Map<String, dynamic> toJson() => {
        "expiry_date": expiryDate.toIso8601String(),
        "is_expired": isExpired,
      };
  @override
  String toString() {
    return "DataModel(expiryDate: $expiryDate,isExpired: $isExpired,)";
  }
}

class SsidDetails {
  SsidDetails({
    required this.id,
    required this.stbId,
    required this.status,
    required this.ssid,
    required this.password,
    required this.mode,
  });

  int id;
  int stbId;
  String status;
  String ssid;
  String password;
  String mode;

  factory SsidDetails.fromJson(Map<String, dynamic> json) => SsidDetails(
        id: json["id"],
        stbId: json["stb_id"],
        status: json["status"],
        ssid: json["ssid"],
        password: json["password"],
        mode: json["mode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stb_id": stbId,
        "status": status,
        "ssid": ssid,
        "password": password,
        "mode": mode,
      };
  @override
  String toString() {
    return "DataModel(id: $id,stbId: $stbId,status: $status,ssid: $ssid,password: $password,mode: $mode,)";
  }
}
