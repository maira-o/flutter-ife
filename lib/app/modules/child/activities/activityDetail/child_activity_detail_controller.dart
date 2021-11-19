import 'package:get/get.dart';

class ChildActivityDetailController extends GetxController {
  final _readingLevel0 = false.obs;
  get readingLevel0 => this._readingLevel0.value;
  set readingLevel0(index) => this._readingLevel0.value = index;

  final _readingLevel1 = false.obs;
  get readingLevel1 => this._readingLevel1.value;
  set readingLevel1(index) => this._readingLevel1.value = index;

  final _readingLevel2 = false.obs;
  get readingLevel2 => this._readingLevel2.value;
  set readingLevel2(index) => this._readingLevel2.value = index;

  final _readingLevel3 = false.obs;
  get readingLevel3 => this._readingLevel3.value;
  set readingLevel3(index) => this._readingLevel3.value = index;

  final _needsSupport = false.obs;
  get needsSupport => this._needsSupport.value;
  set needsSupport(index) => this._needsSupport.value = index;
}