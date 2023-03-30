import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';

class CustomCartItemsList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAddPress;
  final void Function()? onMinusPress;


  const CustomCartItemsList({Key? key, required this.imagename,required this.name, required this.price, required this.count, required this.onAddPress, required this.onMinusPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(2),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/$imagename",
                  height: 80,
                  )
                ),
             Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                   name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  subtitle: Text(
                    price,
                    style:
                        const TextStyle(fontSize: 13, color: AppColor.primaryColor),
                  ),
                )),
            Column(
              children: [
                Container(
                    height: 35,
                    child: IconButton(
                        onPressed: onAddPress, 
                        icon: const Icon(Icons.add))),
                Container(
                    height: 30,
                    child:  Text(
                      count,
                      style: const TextStyle(fontFamily: "sans"),
                    )),
                Container(
                    height: 25,
                    child: IconButton(
                        onPressed:onMinusPress,
                         icon: const Icon(Icons.remove))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
