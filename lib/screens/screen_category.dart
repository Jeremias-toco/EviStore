import 'package:evistore/Components/Categories/Page_computer.dart';
import 'package:evistore/Components/Categories/Page_electrodomestic.dart';
import 'package:evistore/Components/Categories/Page_moda.dart';
import 'package:evistore/Components/Categories/Page_smartfone.dart';
import 'package:evistore/Components/searchBar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with TickerProviderStateMixin{
  
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
        centerTitle: true,
      ),
      body:  SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  SearchbarComponent(
                    onTap: () {
                      Get.toNamed("/products");
                    },
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.all(20),
                      labelColor: Colors.red,
                      indicatorColor: Colors.red,
                      tabs:[
                        Text("Electrodomésticos"),
                        Text("Computadores"),
                        Text("Smartfones"),
                        Text("Verstuários"),
                      ] 
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          PageElectrodomestic(),
                          PageComputer(),
                          PageSmartfone(),
                          PageModa()
                      ],
                    ),
                  )
                ],
              ),
          ),
        ),
      )
    );
  }
}