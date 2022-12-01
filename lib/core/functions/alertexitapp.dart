import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

 Future<bool>alertexitapp() {
   Get.defaultDialog(
      title: "alert".tr,
      middleText: "are_you_sure_to_exit_app".tr,
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("coonifirm".tr)),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("no".tr)),
      ]);

      return Future.value(true);
}
