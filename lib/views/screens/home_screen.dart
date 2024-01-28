import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:platable/views/screens/product_details_screen.dart';

import '../../constants/app_constants.dart';
import '../../models/product_list_model.dart';
import '../../services/state_management.dart';
import 'components/product_container.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Products>? allProducts = [];
  List<Products>? saveProducts = [];

  ScrollController scrollController = ScrollController(
    initialScrollOffset: 10,
    keepScrollOffset: true,
  );

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');

         final String saveResponse =
        await rootBundle.loadString('assets/data/save.json');
    ProductModel data = ProductModel.fromJson(json.decode(response));
    ProductModel saveData = ProductModel.fromJson(json.decode(saveResponse));
    

    setState(() {
      allProducts = data.products;
      saveProducts = saveData.products;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final cardProvider = ref.watch(cartRiverpod);
    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,
      appBar: AppConstant().appBar(context, true, cardProvider, () {}, "", 130),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: AppConstant()
                      .sideHeadings(screenSize, 'Recommended for you'),
                ),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: allProducts!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  product: allProducts![index],
                                ),
                              ),
                            );
                          },
                          child: ProductContainer(
                              containerSize: const Size(160, 600),
                              circleRadius: 60,
                              product: allProducts![index]),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: AppConstant()
                      .sideHeadings(screenSize, "Save before it's too late"),
                ),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    itemCount: saveProducts!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  product: saveProducts![index],
                                ),
                              ),
                            );
                          },
                          child: ProductContainer(
                              containerSize: const Size(160, 600),
                              circleRadius: 60,
                              product: saveProducts![index]),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
