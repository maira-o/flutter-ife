import 'package:flutter/material.dart';
import 'package:gauge_iot/app/modules/landing/landing_controller.dart';
import 'package:get/get.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Landing page"),
      ),
      body: Container(
        child: GetX<LandingController>(
          builder: (_) {
            return Text(_.post);
          },
        ),
      ),
    );
  }
}
