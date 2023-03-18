import 'dart:convert';
import 'dart:io';
import 'package:contact_app/data/app_exceptions.dart';
import 'package:contact_app/data/network/base_api_service.dart';
import 'package:http/http.dart';

class NetworkAPIService extends BaseAPIService {
  @override
  Future deleteAPIResponse(String url) {
    // TODO: implement getAPIResponse
    throw UnimplementedError();
  }

  @override
  Future getAPIResponse(String url) async {
    dynamic responseJSON;

    try {
      final response =
          await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJSON = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection.");
    }

    return responseJSON;
  }

  @override
  Future petchAPIResponse(String url) {
    // TODO: implement petchAPIResponse
    throw UnimplementedError();
  }

  @override
  Future postAPIResponse(String url, dynamic data) async {
    dynamic responseJSON;

    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJSON = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection.");
    }

    return responseJSON;
  }

  @override
  Future putAPIResponse(String url) {
    // TODO: implement putAPIResponse
    throw UnimplementedError();
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 404:
        throw BadRequestException(
            "Request not found. With ${response.body.toString()}");
      default:
        throw FetchDataException(
            "Communication error with status code ${response.statusCode.toString()}.");
    }
  }
}
