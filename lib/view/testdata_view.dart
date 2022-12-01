import 'package:ecommerce/controller/testdata_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestDataView extends StatelessWidget {
  const TestDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: const Text("Title"),
      backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<TestController>(builder: (controller) { 



        return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(

              itemCount: controller.data.length,
              itemBuilder:  (context, index) {
              
              return Text("${controller.data}");
             

            }) );
      



      }),
    );
  }
}