import 'package:flutter_mvvm/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm/data/network/NetworkApiServices.dart';
import 'package:flutter_mvvm/model/product_model.dart';
import 'package:flutter_mvvm/res/app_urls.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<ProductModel> getproductList() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.product);
      return response = ProductModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
