import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationServices {
  Future<Map> getCityList() async {
    final http.Response response = await http.get(
        'https://flutterappserver.herokuapp.com/location/cityList',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed Get City List.');
    }
  }

  Future<Map> getDisc(String plateNumber) async {
    final http.Response response = await http.get(
        'https://flutterappserver.herokuapp.com/location/' + plateNumber,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed Get Disc List.');
    }
  }
}
