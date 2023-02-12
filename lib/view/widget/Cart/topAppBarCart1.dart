import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppBarCart extends StatelessWidget {
  final String title;
  const TopAppBarCart({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              // color: Colors.green,
              alignment: Alignment.centerLeft,
              child:
                  IconButton(onPressed: () {
                    Get.back();
                  },
                   icon:const Icon(Icons.arrow_back))),
        ),
        Expanded(
          child: Container(
            //  color: Colors.red,
            alignment: Alignment.center,
            child: Text(
             
             title,
             
              style:const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      const  Spacer()
      ],
    );
  }
}
