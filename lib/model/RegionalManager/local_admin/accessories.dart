
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:profile_finder/model/RegionalManager/local_admin/local_admin_model.dart';

class ApiConstantsLocalAdmins {
  static String baseUrl = 'https://reqres.in/api/users?page=2';
  static String usersEndpoint = '/users';
}
 List<Test> _modell =[] ;

// LocalAdmin _model = LocalAdmin();
class ApiServiceLocalAdmin {
  
  Future <List<Test>> getusersLocalAdmins() async {
    try {
      var url = Uri.parse(ApiConstantsLocalAdmins.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
         _modell = testFromJson(response.body);
        // return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return _modell;
  }
}