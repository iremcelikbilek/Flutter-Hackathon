import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardServices {
  Future<Map> details(String token) async {
    final http.Response response = await http.get(
        'https://flutterappserver.herokuapp.com/dashboard/details',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token,
        });
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed details.');
    }
  }

  Future<Map> filterStatus(
      String token, String filter, String filterKey) async {
    final http.Response response = await http.get(
        'https://flutterappserver.herokuapp.com/' + filter + '/' + filterKey,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token,
        });
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed filter.');
    }
  }
}
