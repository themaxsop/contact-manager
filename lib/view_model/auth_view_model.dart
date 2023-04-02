import 'package:contact_app/repository/auth_repository.dart';
import 'package:contact_app/utils/routes/routes_name.dart';
import 'package:contact_app/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final _repository = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool status) {
    _loading = status;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);

    _repository.login(data).then((value) {
      setLoading(false);

      // Redirect to Home
      Navigator.pushNamed(context, RoutesName.home);

      // Message
      if (kDebugMode) {
        // Utils.errorMessage(value.toString(), context);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      // Message
      if (kDebugMode) {
        Utils.errorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
