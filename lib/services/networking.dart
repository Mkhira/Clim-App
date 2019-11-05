import 'package:http/http.dart' as http;
import 'dart:convert';

const apikey = 'e4d474caf410b45117ec1dc3a3a6b3a5';

class Networkhelpper {
  Networkhelpper({this.url});
  final String url;
  Future getdata() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else
      print(response.statusCode);
  }
}
