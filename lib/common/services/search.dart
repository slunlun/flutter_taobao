import 'package:http/http.dart' as http;
import 'dart:convert';

Future getSuggest(String q) async {
  String url = 'https://suggest.taobao.com/sug?q=$q&code=utf-8&area=c2c';
  var res = await http.get(url);
  if (res.statusCode == 200) {
    List data = jsonDecode(res.body)['result'] as List;
    return data;
  } else {
    return [];
  }
}

