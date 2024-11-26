import 'package:evistore/pages/Page_home.dart';
import 'package:evistore/screens/screen_cart.dart';
import 'package:evistore/screens/screen_category.dart';
import 'package:evistore/screens/screen_perfil.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class PagePrincipal extends StatelessWidget {
  const PagePrincipal({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: HomePage(), 
            item: ItemConfig(
              activeForegroundColor: Colors.red,
              icon: Icon(Icons.home),
              title: "Início"
            )
          ),
          PersistentTabConfig(
            screen: ScreenCart(), 
            item: ItemConfig(
              activeForegroundColor: Colors.red,
              icon: Icon(Icons.local_grocery_store),
              title: "Carrinho"
            )
          ),
          PersistentTabConfig(
            screen: CategoryPage(), 
            item: ItemConfig(
              activeForegroundColor: Colors.red,
              icon: Icon(Icons.table_chart),
              title: "Categorias"
            )
          ),
          PersistentTabConfig(
            screen: ScreenPerfil(), 
            item: ItemConfig(
              activeForegroundColor: Colors.red,
              icon: Icon(Icons.person),
              title: "Perfil"
            )
          )
        ], 
        navBarHeight: 70,
        backgroundColor: Colors.black,
        navBarBuilder: (NavBarConfig) =>Style2BottomNavBar(
          navBarConfig: NavBarConfig
          ),
        ),
    );
  }
}