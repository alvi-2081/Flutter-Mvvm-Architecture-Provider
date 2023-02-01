import 'package:flutter_mvvm/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm/data/network/NetworkApiServices.dart';
import 'package:flutter_mvvm/res/app_urls.dart';

class Authrepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.login, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.register, data);

      return response;
    } catch (e) {
      throw e;
    }
  }
}
