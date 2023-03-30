import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';

class PriceAddMinus extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onMinus;
  final String price;
  final String count;
  

  
  const PriceAddMinus({Key? key, required this.onAdd, required this.onMinus, required this.price, required this.count, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return               Row(
                children: [
                  Row(children: [
                    IconButton(onPressed: onAdd,
                             icon: const Icon(Icons.add)
                             ),
                    
                    Container(
                      width: 50, //height: 30,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(border: Border.all(),
                     //  color: Colors.red,
                      ),
                      child: Text(count,
                      style: const TextStyle(fontSize: 20),),
                      ),
                    
                    IconButton(onPressed: onMinus, 
                            icon: const Icon(Icons.remove)
                            ),

                  ],
                  ), 
                  const Spacer(flex: 1),
                  
                  
                  
           Text("$price \$" , style: const TextStyle(fontSize: 30.0, color: AppColor.primaryColor, height:1.1 ),),
                ]);
  }
}