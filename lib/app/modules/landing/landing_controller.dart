import 'dart:ui';
import 'package:gauge_iot/app/data/model/LoginResponse.dart';
import 'package:gauge_iot/app/data/provider/LoginProvider.dart';
import 'package:gauge_iot/app/data/provider/Storage.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  final _email = "".obs;
  get email => this._email.value;
  set email(value) {
    this._email.value = value;
    validateForm();
  }

  final _password = "".obs;
  get password => this._password.value;
  set password(value) {
    this._password.value = value;
    validateForm();
  }

  final _isFormValid = false.obs;
  get isFormValid => this._isFormValid.value;
  set isFormValid(value) => this._isFormValid.value = value;

    validateForm() {
    if (!email.isEmpty && !password.isEmpty) {
      isFormValid = true;
    } else {
      isFormValid = false;
    }
  }

  login(VoidCallback closure) async {
    isLoading = true;

    LoginResponse? login = await LoginProvider().postLogin(email, password);

    isLoading = false;

    if (login != null) {
      print("*******, " + login.token);
      print("*******, " + login.message);
      SensitiveStorage().writeValue(StorageValues.loginToken, login.token);

      closure();
    } else {
      print("erro no login");
    }
  }
}
