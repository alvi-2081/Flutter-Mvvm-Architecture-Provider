import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/repository/auth_repository.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class AuthViewmodel with ChangeNotifier {
  final _myRepo = Authrepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }

      setLoading(false);
      Utils.flushBarErrorMessage("Login Successful", context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  setsignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> register(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }

      setLoading(false);
      Utils.flushBarErrorMessage("Signup Successfull", context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
