import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClientApi {
  sendRequest(
      {required String path, required String method, body, headers}) async {
    final url = Uri.parse('https://api.spacexdata.com/v3$path');

    http.Response response;

    if (method == "get") {
      response = await http.get(
        url,
      );
    } else {
      throw Exception('Method not found');
    }

    var responseData = json.decode(response.body);

    if (response.statusCode == 500) {
      throw Exception('Somthing went wrong...');
    } else if (response.statusCode == 200) {
      return responseData;
    } else {
      throw Exception('Faild connection');
    }
  }
}
