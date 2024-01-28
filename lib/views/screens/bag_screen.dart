import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:platable/constants/app_constants.dart';
import 'package:platable/constants/components/bottom_nav_bar.dart';
import 'package:platable/views/screens/order_placed_screen.dart';

import '../../services/state_management.dart';

class BagScreen extends ConsumerStatefulWidget {
  const BagScreen({super.key});

  @override
  ConsumerState<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends ConsumerState<BagScreen> {
  bool isLoading = false;

  navigateToSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderPlaced(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final cartProvider = ref.watch(cartRiverpod);
    return Scaffold(
      appBar: AppConstant().appBar(context, false, cartProvider, () {
        Navigator.pop(context);
      }, 'Bag', 130),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    child: cartProvider.cartItems.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: cartProvider.cartItems.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        width: screenSize.width,
                                        height: 220,
                                        margin: const EdgeInsets.only(top: 30),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppConstant.secondaryColor,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15.0))),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: screenSize.width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  15.0)),
                                                  color: Color(int.parse(
                                                      cartProvider
                                                          .cartItems[index]
                                                          .color
                                                          .toString()))),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 15,
                                                            left: 20),
                                                    width: 25,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    30)),
                                                        color: AppConstant
                                                            .primaryColor),
                                                    child: Image.asset(
                                                        cartProvider
                                                            .cartItems[index]
                                                            .icon
                                                            .toString()),
                                                  ),
                                                  Text(
                                                    cartProvider
                                                        .cartItems[index].name
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: cartProvider
                                                            .cartItems[index]
                                                            .brandColor!
                                                            .toColor(),
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 165,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 5, 20, 5),
                                              width: screenSize.width,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius
                                                    .only(
                                                    bottomLeft:
                                                        Radius.circular(15.0),
                                                    bottomRight:
                                                        Radius.circular(15.0)),
                                                color:
                                                    AppConstant.backgroundColor,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      right: 40,
                                                    ),
                                                    child: Text(
                                                      cartProvider
                                                          .cartItems[index]
                                                          .productName
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                          color: AppConstant
                                                              .primaryTextColor),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/product_icons/star.svg',
                                                        width: 13,
                                                      ),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(
                                                        cartProvider
                                                            .cartItems[index]
                                                            .stars
                                                            .toString(),
                                                        style: AppConstant()
                                                            .kRF12c747e,
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
                                                        width: 13,
                                                      ),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(
                                                        cartProvider
                                                            .cartItems[index]
                                                            .distance
                                                            .toString(),
                                                        style: AppConstant()
                                                            .kRF12c747e,
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/product_icons/clock-circle.svg',
                                                        width: 16,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                          cartProvider
                                                              .cartItems[index]
                                                              .timeSlot!
                                                              .timeRange
                                                              .toString(),
                                                          style: AppConstant()
                                                              .kRF12c747e)
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 100,
                                                        height: 24,
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 3),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          30)),
                                                          color: cartProvider
                                                                      .cartItems[
                                                                          index]
                                                                      .stock! <
                                                                  2
                                                              ? Colors.red
                                                              : AppConstant
                                                                  .primaryYellow,
                                                        ),
                                                        child: Text(
                                                          cartProvider
                                                                      .cartItems[
                                                                          index]
                                                                      .stock! <
                                                                  5
                                                              ? '${int.parse(cartProvider.cartItems[index].stock.toString()).toString()} left'
                                                              : '5+ left',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppConstant
                                                                  .primaryColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '\$ ${int.parse(cartProvider.cartItems[index].todayPrice.toString()) * int.parse(cartProvider.cartItems[index].quantity.toString())}',
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppConstant
                                                                    .primaryTextColor),
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            '${int.parse(cartProvider.cartItems[index].actualPrice.toString()) * int.parse(cartProvider.cartItems[index].quantity.toString())}',
                                                            style: TextStyle(
                                                                color: AppConstant
                                                                    .primaryTextColor,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {
                                                                cartProvider.increaseQuantity(
                                                                    cartProvider
                                                                            .cartItems[
                                                                        index]);
                                                              },
                                                              child: Icon(
                                                                Icons.add,
                                                                color: AppConstant
                                                                    .secondaryColor,
                                                                size: 28,
                                                              ),
                                                            ),
                                                            Text(
                                                              cartProvider
                                                                  .cartItems[
                                                                      index]
                                                                  .quantity
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: AppConstant
                                                                      .secondaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 22),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                cartProvider.decreaseQuantity(
                                                                    cartProvider
                                                                            .cartItems[
                                                                        index]);
                                                              },
                                                              child: Icon(
                                                                Icons.remove,
                                                                color: AppConstant
                                                                    .secondaryColor,
                                                                size: 28,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppConstant.primaryColor,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                            cartProvider.cartItems[index].image
                                                .toString(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox(
                            width: screenSize.width,
                            height: screenSize.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Oops! Nothing added in the cart',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppConstant().commonButton(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavBar(),
                                    ),
                                  );
                                }, 'Explore', false)
                              ],
                            ),
                          ),
                  ),
                  SizedBox(
                    height: screenSize.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppConstant().commonHeadingText('Sub Total'),
                      AppConstant().commonHeadingText(
                          cartProvider.totalPrice.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppConstant().commonHeadingText('Service Tax'),
                      AppConstant().commonHeadingText('3'),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppConstant().commonHeadingText('Total Price'),
                      AppConstant()
                          .commonHeadingText('${cartProvider.totalPrice + 3}')
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height / 20,
                  ),
                  Visibility(
                    visible: cartProvider.cartItems.isNotEmpty,
                    child: AppConstant().commonButton(() {
                      setState(() {
                        isLoading = true;
                      });

                      Future.delayed(const Duration(milliseconds: 900), () {
                        SnackBar snackBar = const SnackBar(
                          content: Text('Payment success'),
                        );
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        cartProvider.cartItems.clear();
                        navigateToSuccess();
                      });
                    }, 'Continue to make payment', false),
                  ),
                ],
              ),
              Visibility(
                visible: isLoading,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  color: Colors.white.withOpacity(0.6),
                  child: AppConstant().loadingIndicator(isLoading),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
