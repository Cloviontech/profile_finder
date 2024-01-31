// // To parse this JSON data, do
// //
// //     final myQuesAndAns = myQuesAndAnsFromJson(jsonString);

// import 'dart:convert';

// MyQuesAndAns myQuesAndAnsFromJson(String str) => MyQuesAndAns.fromJson(json.decode(str));

// String myQuesAndAnsToJson(MyQuesAndAns data) => json.encode(data.toJson());

// class MyQuesAndAns {
//     List<PfId>? pfId;

//     MyQuesAndAns({
//         this.pfId,
//     });

//     factory MyQuesAndAns.fromJson(Map<String, dynamic> json) => MyQuesAndAns(
//         pfId: json["pf_id"] == null ? [] : List<PfId>.from(json["pf_id"]!.map((x) => PfId.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "pf_id": pfId == null ? [] : List<dynamic>.from(pfId!.map((x) => x.toJson())),
//     };
// }

// class PfId {
//     Answer? question;
//     Answer? answer;

//     PfId({
//         this.question,
//         this.answer,
//     });

//     factory PfId.fromJson(Map<String, dynamic> json) => PfId(
//         question: answerValues.map[json["question"]]!,
//         answer: answerValues.map[json["answer"]]!,
//     );

//     Map<String, dynamic> toJson() => {
//         "question": answerValues.reverse[question],
//         "answer": answerValues.reverse[answer],
//     };
// }

// enum Answer {
//     ANSWER_EMPTY,
//     EMPTY,
//     PURPLE_EMPTY
// }

// final answerValues = EnumValues({
//     "[\"empty\"": Answer.ANSWER_EMPTY,
//     "[\"empty\"]": Answer.EMPTY,
//     "\"empty\"]": Answer.PURPLE_EMPTY
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
