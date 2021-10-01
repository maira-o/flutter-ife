import 'package:get/get.dart';

class LandingController extends GetxController {
  final _post = "".obs;
  get post => this._post.value;
  set post(value) => this._post.value = value;
}
