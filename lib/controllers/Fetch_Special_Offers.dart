import 'package:get/get.dart';
import 'package:tea_salon/models/Product.dart';

class Fetch_Special_Offers extends GetxController{
var productList = <Product>[].obs;
@override
  void onInit() {
    super.onInit();
    FetchData();
  }
  void FetchData()async{
  await Future.delayed(Duration(seconds: 2),);
  var productResult =[
    Product(1, '30', 'productmage', 'productImage', 3),
    Product(2, '30', 'producImage', 'prage', 3),
    Product(3, '30', 'productImage', 'producImage', 30),
    Product(4, '30', 'productIme', 'productImage', 30),
    Product(5, '30', 'prductImage', 'productIage', 3),
    Product(6, '30', 'productIage', 'poducImage', 3),
    Product(7, '30', 'productImage', 'prductImage', 30),
    Product(8, '30', 'produtImage', 'productIme', 30),
  ];
  productList.assignAll(productResult);
  }
}