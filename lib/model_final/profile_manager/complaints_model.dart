
class MyComplaintsAndReplies{
  
  final String? complaint;
  final String? reply;
  

   MyComplaintsAndReplies({
     required this.complaint, required this.reply,
  });

  factory MyComplaintsAndReplies.fromJson(
    Map<String, dynamic> 
    // List <dynamic, dynamic>
    json){
    return MyComplaintsAndReplies(
      complaint: json['complaint'] as String?,
      reply: json['reply'] as String?,
     
    );
  }
}