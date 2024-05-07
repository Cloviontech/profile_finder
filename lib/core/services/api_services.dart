import 'package:http/http.dart' as http;
import 'package:profile_finder/model_final/modelAllUser.dart';

class ApiServices {
  // static const String ipAddress = "10.0.2.2:8000";
  static const String ipAddress = "192.168.1.6:8000";
  // static const String ipAddress = "127.0.0.1:3000";
  
  // static const String ipAddress = "10.0.2.2:8000";
  

  
  // static const String ipAddress = "192.168.18.53:8000";
  

  

  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse("http://$ipAddress/alluserdata");

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        return model;
      }

      print(response.statusCode);
    } catch (e) {
      // log(e.toString());
      print("error $e");
    }
    return null;
  }


}



