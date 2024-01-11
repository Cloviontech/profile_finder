// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'dart:convert';

List<Test> testFromJson(String str) => 
List<Test>.from(json.decode(str).map((x) => 
Test.fromJson(x)));

String testToJson(List<Test> data) => 
json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Test {
    int page;
    int perPage;
    int total;
    int totalPages;
    Datum data;
    Support support;

    Test({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
        required this.support,
    });

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: Datum.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data":  data.toJson(),
        "support": support.toJson(),
    };
}

class Datum {
    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    Datum({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    String url;
    String text;

    Support({
        required this.url,
        required this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
