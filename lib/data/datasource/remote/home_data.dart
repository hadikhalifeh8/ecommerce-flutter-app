import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class HomeData {

  Crud crud;
  HomeData(this.crud);

  getData() async {
   var response = await crud.postData(AppLink.homepage ,{});
      return response.fold((l) => l, (r) => r);
  }


    searchData(String search) async {
   var response = await crud.postData(AppLink.search,{
    // '?name_en':search
    'name_en' : '.$search'
      
   });
      return response.fold((l) => l, (r) => r);
  }


  
  
}