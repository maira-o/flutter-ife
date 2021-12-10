import 'package:flutter/material.dart';
import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:gauge_iot/app/utils/date_parser.dart';
import 'package:get/get.dart';

class Emotion {
  RxBool isSelected;
  final String icon;
  final UniqueKey id = UniqueKey();

  Emotion(this.isSelected, this.icon);
}

class ChildActivityDetailController extends GetxController {
  String title = "";
  String date = "";
  String description = "";

  List<Emotion> emotions = [
    Emotion(false.obs, Assets.like_icon),
    Emotion(false.obs, Assets.lingua_icon),
    Emotion(false.obs, Assets.coracao_icon),
    Emotion(false.obs, Assets.choro_icon),
    Emotion(false.obs, Assets.surpresa_icon),
    Emotion(false.obs, Assets.brabo_icon),
  ];

  @override
  void onInit() {
    if (Get.arguments != null) {
      Activity activity = Get.arguments;
      this.title = activity.titulo;
      this.description = activity.descricao;
      this.date = DateParser.convertToDate(activity.createAt.toString());
    }
    super.onInit();
  }

  selectEmotion(UniqueKey id) {
    for (var emotion in emotions) {
      emotion.isSelected.value = false;
      if (emotion.id == id) {
        emotion.isSelected.value = true;
      }
    }
  }
}