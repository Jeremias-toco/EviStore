import 'package:evistore/Controllers/Users_controller.dart';
import 'package:evistore/Models/Product_model.dart';
import 'package:evistore/pages/Page_all_products.dart';
import 'package:evistore/pages/Page_create.dart';
import 'package:evistore/pages/Page_home.dart';
import 'package:evistore/pages/Page_login.dart';
import 'package:evistore/pages/Page_principal.dart';
import 'package:evistore/pages/Pay_get.dart';
import 'package:evistore/pages/page_buy.dart';
import 'package:evistore/pages/page_product.dart';
import 'package:evistore/pages/page_type_pay.dart';
import 'package:evistore/pages/page_upload_pay.dart';
import 'package:evistore/screens/screen_cart.dart';
import 'package:evistore/screens/screen_category.dart';
import 'package:evistore/screens/screen_perfil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

void main() {
  runApp(const initPage());
}

class initPage extends StatefulWidget {
  const initPage({super.key});

  @override
  State<initPage> createState() => _initPageState();
}

class _initPageState extends State<initPage> {

  final UsersController user = Get.put(UsersController());

  @override
  void initState() {
    user.verificarUsuarioLogado();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      getPages: [
        GetPage(name: "/", page: ()=>PageLogin()),
        GetPage(name: "/criar", page: ()=> PageCreate()),
        GetPage(name: "/principal", page: ()=> PagePrincipal()),
        GetPage(name: "/product", page: () => PageProduct()),
        GetPage(name: "/products", page: () => PageAllProducts()),
        GetPage(name: "/pay", page: () => PageTypePay()),
        GetPage(name: "/pay2", page: () => PayGet()),
        GetPage(name: "/pay3", page: () => PageUploadPay()),
         GetPage(name: "/buy", page: () => PageBuy())
      ], 
      initialRoute: "/",
    );
  }
}



