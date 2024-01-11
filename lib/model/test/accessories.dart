



// class ApiConstants {
//   static String baseUrl = 'https://jsonplaceholder.typicode.com';
//   static String usersEndpoint = '/users';
// }
//  List<UserModel> _model = [];
// class ApiService {
  
//   Future<List<UserModel>?> getUsers() async {
//     try {
//       var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//          _model = userModelFromJson(response.body);
//         // return _model;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     return _model;
//   }
// }