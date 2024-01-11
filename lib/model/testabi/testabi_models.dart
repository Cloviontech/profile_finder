// To parse this JSON data, do
//
//     final testAbi = testAbiFromJson(jsonString);

import 'dart:convert';

List<TestAbi> testAbiFromJson(String str) => List<TestAbi>.from(json.decode(str).map((x) => TestAbi.fromJson(x)));

String testAbiToJson(List<TestAbi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestAbi {
    String sid;
    String sname;
    int sage;
    String splace;
    String sgroup;

    TestAbi({
        required this.sid,
        required this.sname,
        required this.sage,
        required this.splace,
        required this.sgroup,
    });

    factory TestAbi.fromJson(Map<String, dynamic> json) => TestAbi(
        sid: json["sid"],
        sname: json["sname"],
        sage: json["sage"],
        splace: json["splace"],
        sgroup: json["sgroup"],
    );

    Map<String, dynamic> toJson() => {
        "sid": sid,
        "sname": sname,
        "sage": sage,
        "splace": splace,
        "sgroup": sgroup,
    };
}
