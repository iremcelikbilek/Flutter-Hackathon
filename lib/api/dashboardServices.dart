import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardServices {
  Future<List> details(String token) async {
    var countList = new List();
    final http.Response response = await http.get(
        'https://flutterappserver.herokuapp.com/dashboard/details',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token,
        });
    print(response.body);
    if (response.statusCode == 200) {
      var responseMap=jsonDecode(response.body);
      countList.add(responseMap["wish_count"]);
      countList.add(responseMap["complaint_count"]);
      countList.add(responseMap["altyapi_count"]);
      countList.add(responseMap["ulasim_count"]);
      countList.add(responseMap["elektrik_count"]);
      countList.add(responseMap["park_ve_bahceler_count"]);
      countList.add(responseMap["temizlik_count"]);
      countList.add(responseMap["resolved_count"]);
      countList.add(responseMap["denied_count"]);
      countList.add(responseMap["delayed_count"]);
      countList.add(responseMap["pending_count"]);
      return countList;
    } else {
      throw Exception('Failed details.');
    }
  }

  Future<Map> filterStatus(String token, String filter, String filterKey) async {
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
