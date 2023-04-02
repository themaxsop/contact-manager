import 'package:contact_app/data/network/base_api_service.dart';
import 'package:contact_app/data/network/network_api_service.dart';
import 'package:contact_app/res/app_urls.dart';

class AuthRepository {
  final BaseAPIService _apiService = NetworkAPIService();

  // Login
  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response =
          await _apiService.postAPIResponse(AppUrls.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Register
  Future<dynamic> register(dynamic data) async {
    try {
      dynamic response =
          await _apiService.postAPIResponse(AppUrls.registerEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
