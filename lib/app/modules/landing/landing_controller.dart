import 'dart:developer';
import 'dart:ui';
import 'package:gauge_iot/app/data/model/LoginResponse.dart';
import 'package:gauge_iot/app/data/model/UserFull.dart';
import 'package:gauge_iot/app/data/model/shared_preferences_manager.dart';
import 'package:gauge_iot/app/data/provider/LoginProvider.dart';
import 'package:gauge_iot/app/data/provider/Storage.dart';
import 'package:gauge_iot/app/data/provider/UserProvider.dart';
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
    if (email == "" || password == "") {
      isFormValid = false;
    } else {
      isFormValid = true;
    }
  }

  login(Function(int) closure) async {
    // SharedPreferencesManager.
    SensitiveStorage().deleteAll();
    bool deleteUser = await SharedPreferencesManager.deleteUser();
    bool deleteTeacherkey = await SharedPreferencesManager.deleteTeacherKey();
    
    isLoading = true;

    LoginResponse? login = await LoginProvider().postLogin(email, password);

    isLoading = false;

    if (login != null) {
      bool saveUser = await SharedPreferencesManager.saveUser(login.usuario);
      SensitiveStorage().writeValue(StorageValues.loginToken, login.token);

      if (login.usuario.papel == 2) {
        UserFull? userFull = await UserProvider().getUserFull(login.usuario.id);

        if (userFull != null) {
          bool saveTeacherId = await SharedPreferencesManager.saveTeacherKey(userFull.usuario.crianca.educador);

          print("sucesso em salvar teacher key: $saveTeacherId");
        }
      }

      closure(login.usuario.papel);
    } else {
      print("erro no login");
    }
  }
}
