import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/core/auth_store.dart';
import 'package:kannada_devangar/utility/local_storage_impl.dart';
import 'http_client.dart';

class InitialBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LocalStorage>(()=> LocalStorageImpl());
    Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);
    Get.put<AuthStore>(AuthStore(Get.find<LocalStorage>()), permanent: true);
  }
}