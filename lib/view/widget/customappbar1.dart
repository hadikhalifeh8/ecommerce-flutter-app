// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

final String titleappbar; 
// final void Function()? onPressedIcon;
final void Function()? onPressedSearch;
final void Function()? onPressedIconFavorite;
final void Function(String)? onChanged;
final TextEditingController mycontroller;


  const CustomAppBar({
    Key? key,
    required this.titleappbar,
   // required this.onPressedIcon,
    required this.onPressedSearch, 
    required this.onPressedIconFavorite,
    this.onChanged, 
    required this.mycontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return            Container(
              margin:const EdgeInsets.only(top: 10.0),
              
              
              child: Row(
              children: [
                Expanded(child: TextFormField(
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(onPressed: onPressedSearch, icon: Icon(Icons.search)),
                   // hintText: "Find Product",
                    hintText: titleappbar,
                    hintStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    
                    filled: true,
                    fillColor: Colors.grey[200]
                  ),
                ),  
                ),

    // notification icon
      SizedBox(width: 10.0,),

                // Container(
                //   decoration: BoxDecoration(
                //      color: Colors.grey[200],
                //     borderRadius: BorderRadius.circular(10.0)),
                //   width: 50.0,
                //   padding: EdgeInsets.symmetric(vertical: 8.0),
                 
                //   child: IconButton(
                // //    onPressed: (){}, 
                //       onPressed: onPressedIcon,
                //   icon:const Icon(Icons.notifications_active_outlined, size: 25.0,color: Colors.grey)),
                //   ),

          // favorite icon
                    SizedBox(width: 10.0,),

                Container(
                  decoration: BoxDecoration(
                     color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0)),
                  width: 50.0,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                 
                  child: IconButton(
                //    onPressed: (){}, 
                      onPressed: onPressedIconFavorite,
                  icon:const Icon(Icons.favorite_border_outlined, size: 25.0,color: Colors.grey)),
                  ),
              ],
            ),
            );
  }
}
