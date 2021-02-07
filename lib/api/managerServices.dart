import 'dart:convert';
import 'package:http/http.dart' as http;

class ManagerServices {
  Future<Map> answer(String token, String recordId, String answer, String status) async {
    final http.Response response = await http.post(
        'https://flutterappserver.herokuapp.com/answer/new',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token,
        },
        body: jsonEncode(<String, String>{
          'recordId': recordId,
          'answer': answer,
          'status': status
        }));
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed answer.');
    }
  }
}
