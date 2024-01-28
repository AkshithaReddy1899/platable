import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/app_constants.dart';
import '../../models/product_list_model.dart';
import '../../services/state_management.dart';
import 'components/product_container.dart';
import 'components/reviews.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final Products product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  List<Products>? allProducts = [];
  bool showReviews = false;

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');

    ProductModel data = ProductModel.fromJson(json.decode(response));

    setState(() {
      allProducts = data.products;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final cartProvider = ref.watch(cartRiverpod);
    return Scaffold(
      appBar: AppConstant().appBar(context, false, cartProvider, () {
        Navigator.pop(context);
      }, 'Product Detail', 200),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: screenSize.height / 40),
            child: Stack(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 120 / 2.0,
                      ),
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color:
                              Color(int.parse(widget.product.color.toString())),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                              offset: Offset(0.0, 2.0),
                            ),
                          ],
                        ),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                color: widget.product.color!.toColor(),
                              ),
                              width: screenSize.width,
                              height: 120 * 1.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(20),
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            color:  widget.product.brandColor!.toColor()),
                                        child: Image.asset(
                                            widget.product.icon.toString()),
                                      ),
                                      Text(
                                        widget.product.name.toString(),
                                        style: TextStyle(
                                            color:  widget.product.brandColor!.toColor(),
                                            fontSize: 22),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(20),
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SvgPicture.asset(
                                        'assets/images/nav/bookmark.svg'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppConstant.backgroundColor,
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        child: Image.network(
                          widget.product.image.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: AppConstant.backgroundColor,
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                            right: 40,
                          ),
                          child: Text(
                            widget.product.productName.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                color: AppConstant.primaryTextColor),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.timeSlot!.day.toString(),
                              style: AppConstant().kRF16c747e,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            AppConstant().ellipse,
                            const SizedBox(
                              width: 12,
                            ),
                            SvgPicture.asset(
                              'assets/images/product_icons/clock-circle.svg',
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(widget.product.timeSlot!.timeRange.toString(),
                                style: AppConstant().kRF16c747e)
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/product_icons/star.svg',
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              widget.product.stars.toString(),
                              style: AppConstant().kRF12c747e,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            AppConstant().ellipse,
                            const SizedBox(
                              width: 6,
                            ),
                            SvgPicture.asset(
                              'assets/images/product_icons/map.svg',
                              width: 16,
                              height: 16,
                            ),
                            Text(
                              widget.product.distance.toString(),
                              style: AppConstant().kRF12c747e,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: widget.product.stock! < 2
                                    ? Colors.red
                                    : AppConstant.primaryYellow,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.product.stock! > 5
                                        ? '5+ left'
                                        : '${int.parse(widget.product.stock.toString()).toString()} left',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppConstant.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '\$ ${widget.product.todayPrice.toString()}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: AppConstant.primaryTextColor),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  widget.product.actualPrice.toString(),
                                  style: const TextStyle(
                                      color: Color(0xff7C747E),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.lineThrough),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          widget.product.description.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.6,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff7F7667),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: screenSize.width,
                          alignment: Alignment.topLeft,
                          child: AppConstant().commonButton(() {
                            cartProvider.addItemToCart(widget.product);
                            print(cartProvider.cartItems[0].quantity);
                            SnackBar snackBar = SnackBar(
                              content: Text(
                                  '${widget.product.productName} added to cart'),
                            );
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }, 'Add to bag', false),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        AppConstant().widgetforproductSideHeading(
                          'assets/images/product_icons/store.svg',
                          screenSize,
                          'Direction',
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.expand_less),
                          ),
                        ),
                        const Divider(
                          color: Color(0xffF6EFF3),
                        ),
                        AppConstant().widgetforproductSideHeading(
                          'assets/images/product_icons/facts.svg',
                          screenSize,
                          'Nutritional Facts',
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.expand_less),
                          ),
                        ),
                        const Divider(
                          color: Color(0xffF6EFF3),
                        ),
                        AppConstant().widgetforproductSideHeading(
                          'assets/images/product_icons/star.svg',
                          screenSize,
                          'Review',
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (showReviews == false) {
                                  showReviews = true;
                                } else {
                                  showReviews = false;
                                }
                              });
                            },
                            icon: Icon(showReviews
                                ? Icons.expand_more
                                : Icons.expand_less),
                          ),
                        ),
                        Visibility(
                          visible: showReviews,
                          child: SizedBox(
                            width: screenSize.width,
                            height: 400,
                            child: ProductReviews(
                                product: widget.product),
                          ),
                        ),
                        const Divider(
                          color: Color(0xffF6EFF3),
                        ),
                        SizedBox(
                          width: screenSize.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: AppConstant().sideHeadings(
                                    screenSize, 'Recommended for you'),
                              ),
                              SizedBox(
                                height: 230,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: allProducts!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailScreen(
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppConstant.primaryColor,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {
                            cartProvider.addItemToCart(widget.product);
                            SnackBar snackBar = SnackBar(
                              content: Text(
                                  '${widget.product.productName} added to cart'),
                            );
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Text(
                            'Add to bag',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppConstant.primaryTextColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
