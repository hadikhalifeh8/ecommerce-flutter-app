// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/controller/pages/orders/archieveOrders_Controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/orders/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/controller/pages/orders/pendingOrders_Controller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/data/model/orderModel.dart';
import 'package:jiffy/jiffy.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersArchiveController controller = Get.put(OrdersArchiveController());
    return Scaffold(
               appBar: AppBar(title: const Text("Archive Orders")),
               body: Container(padding: EdgeInsets.all(10.0),
                
                child:  GetBuilder<OrdersArchiveController>(builder: (controller) => 
               
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

class CardOrdersList extends GetView<OrdersArchiveController> {
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
                           MaterialButton(color: AppColor.thirdColor, 
                           onPressed: (){
                            //لجيب المعلومات function أحسن ما إرجع إعمل 
                            // detailsOrder_controller

                                    Get.toNamed(AppRoute.detailsOrder, 
                                     arguments: {"Model_Of_Order_list" : listdata});
                           } , 
                           child: Text("Details", style: TextStyle(color: AppColor.primaryColor),),
                           ),


                             Spacer(),


 // if rating == 0 show the rate button else hide 

 if(listdata.orderRating == 0)
                           MaterialButton(color: AppColor.thirdColor, 
                           onPressed: (){
                            // from rating_dialog.dart
                            // (comment, rate, orderid)
                                 showDialogRaing(context, listdata.id.toString());
                           } , 
                           child: Text("Rate", style: TextStyle(color: AppColor.primaryColor),),
                           ),
                       
                         
                         const SizedBox(width: 10.0,),
                         // if order status => Await Approve then show delete buton else hide
                         
                        //  if(listdata.status.toString() == "0")
                        //         MaterialButton(color: AppColor.thirdColor, 
                        //    onPressed: (){
                        //                 controller.deleteOrder(listdata.id.toString());
                        //    } , 
                        //    child: Text("Delete", style: TextStyle(color: AppColor.primaryColor),),
                        //    ),
                         
                         ],
                       ),




                    ],)
                    
                    ),);
  }
}
