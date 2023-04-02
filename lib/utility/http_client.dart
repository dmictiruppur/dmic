import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

_setHeaders() =>
    {'Content-type': 'application/json', 'Accept': 'application/json'};

abstract class HttpClient {
  Future<dynamic> get(String url,
      {Map<String, dynamic> headers,
      Map<String, dynamic> queryParameters,
      bool authorization = false});
  Future<dynamic> post(String url,
      {Map headers, @required body, bool authorization = false});
  Future<dynamic> put(String url,
      {Map headers, @required body, bool authorization = false});
}

class HttpClientImpl implements HttpClient {
  final Dio _dio;

  HttpClientImpl(this._dio) {
    //_initApiClient();
  }

  @override
  Future get(String url,
      {Map<String, dynamic> headers,
      Map<String, dynamic> queryParameters,
      bool authorization = false}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(String url, {Map headers, body, bool authorization = false}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String url, {Map headers, body, bool authorization = false}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  /*void _initApiClient() {
    _dio..options.baseUrl = URLs.baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          return options;
        },
        onResponse: (Response response) async {
          return response;
        },
        onError: (DioError e) async {
          // if (e.response.data['message'] == 'Invalid JWT Token') {
          //   Modular.to.pushReplacementNamed(Routers.userLogin);
          // }

          return e;
        },
      ),
    );
  }*/

  /*Future<dynamic> get(
      String url, {
        Map<String, dynamic> headers,
        Map<String, dynamic> queryParameters,
        bool authorization = false,
      }) async {
    try {
      if (authorization) {
        _dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              if (!options.headers.containsKey("Authorization") &&
                  AuthStore.to.token != null) {
                options.headers["Authorization"] =
                "Bearer ${AuthStore.to.token}";
              }
              return options;
            },
            onResponse: (Response response) async {
              return response;
            },
            onError: (DioError e) async {
              // if (e.response.data['message'] == 'Invalid JWT Token') {
              //   Modular.to.pushReplacementNamed(Routers.userLogin);
              // }

              return e;
            },
          ),
        );
      }

      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - GET] Server Response: $res');

      return response.data;
    } on DioError catch (e) {
      // print('[API Dio Helper - GET] Connection Exception => ' + e.message);

      if (e?.response?.data != null) throw Exception(e.response.data);

      throw Exception(e.message);
    }
  }*/

  /*Future<dynamic> post(
      String url, {
        Map headers,
        @required body,
        bool authorization = false,
      }) async {
    try {
      // print('[API Dio Helper - POST] Server Request: $body');
      if (authorization) {
        _dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              */ /*if (!options.headers.containsKey("Authorization") &&
                  AuthStore.to.token != null) {
                options.headers["Authorization"] =
                "Bearer ${AuthStore.to.token}";
              }*/ /*
              return options;
            },
            onResponse: (Response response) async {
              return response;
            },
            onError: (DioError e) async {
              // if (e.response.data['message'] == 'Invalid JWT Token') {
              //   Modular.to.pushReplacementNamed(Routers.userLogin);
              // }

              return e;
            },
          ),
        );
      }

      final response =
      await _dio.post(url, data: body, options: Options(headers: headers));

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - POST] Server Response: ' + res);

      return response.data;
    } on DioError catch (e) {
      // print('[API Dio Helper - POST] Connection Exception => ' + e.message);

      // if (e.response.statusCode == 401) {
      //   Modular.to.pushReplacementNamed(Routers.userLogin);
      // }

      if (e?.response?.data != null) throw Exception(e.response.data);

      throw Exception(e.message);
    }
  }*/

  /*Future put(
      String url, {
        Map headers,
        @required body,
        bool authorization = false,
      }) async {
    try {
      // print('[API Dio Helper - POST] Server Request: $body');
      if (authorization) {
        _dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              print('TOKENN >>> ${AuthStore.to.token}');

              if (!options.headers.containsKey("Authorization") &&
                  AuthStore.to.token != null) {
                options.headers["Authorization"] =
                "Bearer ${AuthStore.to.token}";
              }
              return options;
            },
            onResponse: (Response response) async {
              return response;
            },
            onError: (DioError e) async {
              // if (e.response.data['message'] == 'Invalid JWT Token') {
              //   Modular.to.pushReplacementNamed(Routers.userLogin);
              // }

              return e;
            },
          ),
        );
      }

      final response =
      await _dio.put(url, data: body, options: Options(headers: headers));

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - POST] Server Response: ' + res);

      return response.data;
    } on DioError catch (e) {
      // print('[API Dio Helper - POST] Connection Exception => ' + e.message);

      if (e?.response?.data != null) throw ServerException(e.response.data);

      throw Exception(e.message);
    }
  }*/
}
