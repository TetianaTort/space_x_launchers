import 'package:space_x_launchers/global/utils/http_client.dart';

class Api {
  HttpClientApi clientApi = HttpClientApi();

  Future getRocket() async {
    return await clientApi.sendRequest(path: '/rockets', method: 'get');
  }

  Future getMissions(id) async {
    return await clientApi.sendRequest(
        path: '/launches?rocket_id=$id', method: 'get');
  }
}
