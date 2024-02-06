
class MyQuesAndAns1{
  
  final String? question;
  final String? answer;
  

  const MyQuesAndAns1({
     required this.question, required this.answer,
  });

  factory MyQuesAndAns1.fromJson(
    Map<String, dynamic> 
    // List <dynamic, dynamic>
    json){
    return MyQuesAndAns1(
      question: json['question'] as String?,
      answer: json['answer'] as String?,
     
    );
  }
}