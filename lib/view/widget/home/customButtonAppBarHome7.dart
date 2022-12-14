import 'package:ecommerce/controller/pages/home/homeScreenconroller.dart';
import 'package:ecommerce/view/widget/home/customButtonAppBar6.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppBarHome extends StatelessWidget {
  const CustomButtonAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
       return GetBuilder<HomeScreenconrollerImp>(builder: (controller) =>BottomAppBar(
        
        shape: const CircularNotchedRectangle(), // شكل الدائره اللي بالنص
        notchMargin:10.0 ,

        child: Row(children: [

        
          
             //  list generate  للتكرا بستخدم  
          ...List.generate(
            controller.listPage.length + 1, 
           
            ((index) {
               int i = index > 2 ? index - 1 : index;

                return  index == 2 ? const Spacer():
                 CustomButtonAppBar( textbutton: controller.listTitleBottomAppBar[i],
                    icondata: Icons.home,
                    
                     onPressed: (){
                     //  controller.changePage(index);
                       controller.changePage(i);
                     },
                     activecolor: controller.currentpage == i ? true : false,
             );
            }
            
     

    ),
          ) 
  

      ],)));
   
   }
}
   
   
   
  ////////////////// 2nd /////////////////////////////////////////////
   
//     return BottomAppBar(
        
//         shape: const CircularNotchedRectangle(), // شكل الدائره اللي بالنص
//         notchMargin:10.0 ,

//         child: Row(children: [

//           //list generate  للتكرا بستخدم  
//           // ...List.generate(
//           //   controller.listPage.length + 1, 
//           //   (index) => index == 2 ? const Spacer() : // for spacer in the middle
//           //   CustomButtonAppBar( textbutton: controller.listTitleBottomAppBar[index > 2 ? index - 1 : index],
//           //           icondata: Icons.home,
                    
//           //            onPressed: (){
//           //            //  controller.changePage(index);
//           //              controller.changePage(index > 2 ? index - 1 : index);
//           //            },
//           //            activecolor: controller.currentpage == index ?true : false,
//           // ),

//           ////////////OR//////////
          
//              //  list generate  للتكرا بستخدم  
//           ...List.generate(
//             controller.listPage.length + 1, 
           
//             (index) {
//                int i = index > 2 ? index - 1 : index;

//                 return   CustomButtonAppBar( textbutton: controller.listTitleBottomAppBar[i],
//                     icondata: Icons.home,
                    
//                      onPressed: (){
//                      //  controller.changePage(index);
//                        controller.changePage(i);
//                      },
//                      activecolor: controller.currentpage == i ?true : false,
//           );
//             }
            
        
//        ////////////OR//////////   
      
// //        Row(children: [

//      ////////////////// اول شكل
// //       // MaterialButton(onPressed: (){
// //       //   controller.changePage(0);
// //       // },
// //       //   child: Column(
// //       //     mainAxisSize: MainAxisSize.min,
// //       //     children: [
// //       //       Icon(Icons.home),
// //       //       Text("home")
// //       //     ],
// //       //   ),
// //       //   ),
// ////////////////// اول شكل

// //    CustomButtonAppBar( textbutton: "home",
// //                      icondata: Icons.home,
// //                       onPressed: (){
// //                         controller.changePage(0);
// //                       },
// //                       activecolor: controller.currentpage == 0 ?true : false,
                     
// //    ),


// //          CustomButtonAppBar( textbutton: "settings",
// //                      icondata: Icons.settings,
// //                      onPressed: (){
// //                         controller.changePage(1);
// //                       },
// //                       activecolor: controller.currentpage == 1 ?true : false,
                      
// //    ),

// //        ],),

// //  Spacer(),

// //        Row(children: [
       
// //    CustomButtonAppBar( textbutton: "Profile",
// //                      icondata: Icons.home,
// //                       onPressed: (){
// //                         controller.changePage(2);
// //                       },
// //                       activecolor: controller.currentpage == 2 ?true : false,
// //    ),

  
// //    CustomButtonAppBar( textbutton: "Favorite",
// //                      icondata: Icons.home,
// //                       onPressed: (){
// //                         controller.changePage(3);
// //                       },
// //                       activecolor: controller.currentpage == 3 ?true : false,
// //    ),

//     ),
    
  

//       ],));
//   }
// }