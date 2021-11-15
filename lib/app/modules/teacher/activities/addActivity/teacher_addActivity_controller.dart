import 'package:get/get.dart';

class Teste {
  RxBool isSelected;
  final String name;

  Teste(this.isSelected, this.name);
}

class TeacherAddActivityController extends GetxController {
  RxList<Teste> children = <Teste>[].obs;

  init() {
    List<Teste> childrenList = <Teste>[].obs;
    for (int i = 0; i < 10; i++) {
      Teste teste = Teste(false.obs, "Carol $i");
      childrenList.add(teste);
    }
    children.value = childrenList;
  }

  selectChild(int index, bool value) {
    children[index].isSelected.value = value;
  }
}