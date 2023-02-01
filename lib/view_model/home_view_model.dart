import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/data/response/api_response.dart';
import 'package:flutter_mvvm/model/product_model.dart';
import 'package:flutter_mvvm/repository/home_reposity.dart';

class HomeViewviewModel extends ChangeNotifier {
  final _myrepo = HomeRepository();

  ApiResponse<ProductModel> productList = ApiResponse.loading();

  setProductList(ApiResponse<ProductModel> response) {
    productList = response;
    notifyListeners();
  }

  Future<void> fetchProduct() async {
    setProductList(ApiResponse.loading());
    _myrepo
        .getproductList()
        .then((value) =>
            setProductList(ApiResponse.completed(value) as List<ProductModel>))
        .onError((error, stackTrace) => ApiResponse.error(error.toString()));
  }
}
