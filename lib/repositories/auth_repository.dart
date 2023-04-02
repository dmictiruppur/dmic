import 'dart:convert';
import 'package:kannada_devangar/utility/http_client.dart';
import 'package:kannada_devangar/models/auth_model.dart';
import 'package:kannada_devangar/core/urls.dart';

abstract class AuthRepository {
  Future<AppModel> authLocal(String identifier, String password);
  Future<AppModel> registerLocal(
      String MemberName_ta,
      String NewAadharNo,
      );
}

class AuthRepositoryImpl implements AuthRepository {
  final HttpClient _client;
  AuthRepositoryImpl(this._client);

  @override
  Future<AppModel> authLocal(String identifier, String password) async {
    final body = {'UserName': identifier, 'Password': password};
    final response = await _client.post(URLs.authLocal, headers: _setHeaders(), body: jsonEncode(body));
    print(response['user']);
    /*final response = await http.post(URLs.authLocal, body: jsonEncode(body));
    print(response);*/
    //user = _storage.read(response);

    return AppModel.fromMap(response);
  }

  @override
  Future<AppModel> registerLocal(
      String MemberName_ta,
      String NewAadharNo,
      ) async {
    final body = {
      'MemberName_ta': MemberName_ta,
      'UserName': NewAadharNo,
    };

    final response = await _client.post(URLs.registerLocal, headers: _setHeaders(), body: body);
    return AppModel.fromMap(response);
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Access-Control_Allow_Origin' : '*'
  };
}
