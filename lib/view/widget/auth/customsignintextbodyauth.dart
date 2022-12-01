import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSignInTextBodyAuth extends StatelessWidget {
  final String  textBody; 
  const CustomSignInTextBodyAuth({Key? key, required this.textBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(textBody.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2)
                    );
  }
}