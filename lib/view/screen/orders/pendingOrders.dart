// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/controller/pages/orders/pendingOrders_Controller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/data/model/orderModel.dart';
import 'package:jiffy/jiffy.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersPendingController controller = Get.put(OrdersPendingController());
    return Scaffold(
               appBar: AppBar(title: const Text("Orders")),
               body: Container(padding: EdgeInsets.all(10.0),
                
                child:  GetBuilder<OrdersPendingController>(builder: (controller) => 
               
                HandlingDataView(statusRequest: controller.statusRequest, 
                
                widget:  ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CardOrdersList(listdata: controller.data[index],)
                  )

                  ),
                //]
                )
               


               
             )
               
    
    
    );
    
  }
}

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({
    Key? key,
    required this.listdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return        Card(child:
               Container(
                
                
                padding: EdgeInsets.all(10.0),
                child: 
                    Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(children: [
                           Text("Order Number : ${listdata.id}", style: const TextStyle(fontSize: 18),),
                           Spacer(),
                         
                          // Text("${listdata.orderDate}"),
                          //  Text("${Jiffy("2011-10-31", "yyyy-MM-dd").fromNow()}"),
                           Text(Jiffy(listdata.orderDate, "yyyy-MM-dd").fromNow(),
                           style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                           
                           ),

                        ],),
                      const Divider(),

                       //Text("Order Type : ${listdata.orderType}"),
                       Text("Order Type : ${controller.printOrderType(listdata.orderType.toString())}" ),

                        Text("Order price : ${listdata.orderPrice} \$"),


                       Text("Delivery price : ${listdata.orderPriceDelivery} \$"),

                       Text("payment Method : ${controller.printPaymentMethod(listdata.paymentMethod.toString())}"),

                       Text("Status : ${controller.printOrderStatus(listdata.status.toString())}"),

                       
                       
                       Divider(),
                       Row(
                         children: [
                           Text("total Price : ${listdata.totalPrice}\$", style:TextStyle(color: AppColor.primaryColor)),
                           Spacer(),
                           MaterialButton(color: AppColor.thirdColor, onPressed: (){} , child: Text("Details", style: TextStyle(color: AppColor.primaryColor),),)
                         ],
                       ),




                    ],)
                    
                    ),);
  }
}
