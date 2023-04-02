import 'dart:convert';

import 'package:kannada_devangar/utility/http_client.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> authLocal(String identifier, String password);
  Future<UserModel> updateUser(UserModel user);
}

class UserRepositoryImpl extends UserRepository {
  final HttpClient _client;

  UserRepositoryImpl(this._client);

  @override
  Future<UserModel> updateUser(UserModel user) async {
    final response = await _client.post('${URLs.users}/${user.RegistrationId}',
        body: user.toMap(), authorization: false);

    return UserModel.fromMap(response);
  }

  @override
  Future<UserModel> authLocal(String identifier, String password) async {
    final body = {'UserName': identifier, 'Password': password};
    final response = await _client.post(URLs.authLocal,
        headers: _setHeaders(), body: jsonEncode(body));
    print(response['user']);
    /*final response = await http.post(URLs.authLocal, body: jsonEncode(body));
      print(response);*/
    //user = _storage.read(response);

    return UserModel.fromMap(response);
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Access-Control_Allow_Origin': '*'
      };
}
