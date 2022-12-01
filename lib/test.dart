import 'package:ecommerce/core/functions/checkInternet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';



class Test extends StatefulWidget {
  

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

var rslt;

initialData() async{
  rslt = await checkInternet();
  print(rslt);
}

@override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(title: const Text("test"),),
      body: Container(
              padding: const EdgeInsets.all(20.0),
        child: ListView(children:  [

  // 1- flutter_otp_text_field 1.0.1 
  OtpTextField(
    fieldWidth: 50.0,
    borderRadius: BorderRadius.circular(20.0),
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
            showDialog(
                context: context,
                builder: (context){
                return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                );
                }
            );
        }, // end onSubmit
    ),
    // 1- flutter_otp_text_field 1.0.1 
        ], ),
      ),
    );
  }
}