import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text("Check Out"),),

          body: Container(
            padding: EdgeInsets.all(20.0),
            
            child: 
          ListView(children: [
            Text("Choose Payment Method", style: TextStyle(color: AppColor.secoundColor, fontWeight: FontWeight.bold,fontSize: 16.0),),
          
          Container(
           
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      decoration: BoxDecoration(
                       color: AppColor.secoundColor,
                       borderRadius: BorderRadius.circular(15),
                       ),

            child: const Text("Cach" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, height: 1),),
            ),

               Container(
           
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      decoration: BoxDecoration(
                       color: AppColor.thirdColor,
                       borderRadius: BorderRadius.circular(15),
                       ),

            child: const Text("Payment Method" , style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.primaryColor,height: 1),),
            ),
          
          ],


          ),
          ),
    );
  }
}