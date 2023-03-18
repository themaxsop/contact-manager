abstract class BaseAPIService {
  Future<dynamic> getAPIResponse(String url);
  Future<dynamic> postAPIResponse(String url, dynamic data);
  Future<dynamic> putAPIResponse(String url);
  Future<dynamic> petchAPIResponse(String url);
  Future<dynamic> deleteAPIResponse(String url);
}
