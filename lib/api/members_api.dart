import 'package:cry/model/response_body_api.dart';
import 'package:cry/utils/http_util.dart';
import 'package:kannada_devangar/core/urls.dart';

class MembersApi {
  static Future<ResponseBodyApi> register(data) async {
    ResponseBodyApi responseBodyApi = await HttpUtil.post('/user/register', data: data, requestToken: false);
    return responseBodyApi;
  }

  static Future<ResponseBodyApi> login(data) async {
    // String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    ResponseBodyApi responseBodyApi = await HttpUtil.post(URLs.authLocal, data: data, requestToken: false);
    return responseBodyApi;
  }
}
