import 'dart:convert';
import 'package:http/http.dart' as http;

class RecordServices {
  Future<Map> addRecord(Map body, String token) async {
    print(body.toString());
    final http.Response response =
        await http.post('https://flutterappserver.herokuapp.com/record/new',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ' + token,
            },
            body: jsonEncode(body));
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed Added.');
    }
  }

  Future<List<Map<String,dynamic>>> myRecordList(String token) async {
    final http.Response response = await http.get(
        'https://flutterappserver.herokuapp.com/user/records',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token,
        });
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed My Record List.');
    }
  }

  Future<List<Map<String,dynamic>>> districtRecordList(String token) async {
    final http.Response response = await http.get(
        'https://flutterappserver.herokuapp.com/record/allFiltered',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token,
        });
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed District Record List.');
    }
  }
}
