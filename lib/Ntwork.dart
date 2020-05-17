import 'package:http/http.dart' as http;
import 'dart:convert';

class Ntwrk{
  var data;
  double temp;
  Ntwrk(this.url);
  final String url;

  http.Response res;
  Future  getData() async {
    res = await http.get(url);

   if(res.statusCode==200) {
     data = res.body;
//    temp = jsonDecode(data)['main']['temp'];
     return jsonDecode(data);
   }
   else
     print(res.statusCode);

  }

}