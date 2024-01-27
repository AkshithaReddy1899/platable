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
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  cartProvider.cartItems.isNotEmpty
                      ? Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppConstant.secondaryColor,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0))),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: screenSize.width,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0)),
                                        color: Color(int.parse(cartProvider
                                            .cartItems[0].color
                                            .toString()))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              right: 15, left: 20),
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(30)),
                                              color: AppConstant.primaryColor),
                                          child: Image.asset(cartProvider
                                              .cartItems[0].icon
                                              .toString()),
                                        ),
                                        Text(
                                          cartProvider.cartItems[0].name
                                              .toString(),
                                          style: TextStyle(
                                              color: AppConstant.primaryColor,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 190,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    width: screenSize.width,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0)),
                                        color: AppConstant.backgroundColor),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                            right: 40,
                                          ),
                                          child: Text(
                                            cartProvider
                                                .cartItems[0].productName
                                                .toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
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
                                              cartProvider.cartItems[0].stars
                                                  .toString(),
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
                                              width: 13,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              cartProvider.cartItems[0].distance
                                                  .toString(),
                                              style: AppConstant().kRF12c747e,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
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
                                                cartProvider.cartItems[0]
                                                    .timeSlot!.timeRange
                                                    .toString(),
                                                style: AppConstant().kRF16c747e)
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 24,
                                              padding:
                                                  const EdgeInsets.only(top: 3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(30)),
                                                color: cartProvider.cartItems[0]
                                                            .stock! <
                                                        2
                                                    ? Colors.red
                                                    : AppConstant.primaryYellow,
                                              ),
                                              child: Text(
                                                cartProvider.cartItems[0]
                                                            .stock! <
                                                        5
                                                    ? '${int.parse(cartProvider.cartItems[0].stock.toString()).toString()} left'
                                                    : '5+ left',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppConstant
                                                        .primaryColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '\$ ${int.parse(cartProvider.cartItems[0].todayPrice.toString()) * int.parse(cartProvider.cartItems[0].quantity.toString())}',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppConstant
                                                          .primaryTextColor),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  '${int.parse(cartProvider.cartItems[0].actualPrice.toString()) * int.parse(cartProvider.cartItems[0].quantity.toString())}',
                                                  style: TextStyle(
                                                      color: AppConstant
                                                          .primaryTextColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              child: Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      cartProvider
                                                          .increaseQuantity(
                                                              cartProvider
                                                                  .cartItems[0]);
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
                                                        .cartItems[0].quantity
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: AppConstant
                                                            .secondaryColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 22),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      cartProvider
                                                          .decreaseQuantity(
                                                              cartProvider
                                                                  .cartItems[0]);
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
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppConstant.primaryColor,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  cartProvider.cartItems[0].image.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: screenSize.width,
                          height: screenSize.height / 2,
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
                                    builder: (context) => const BottomNavBar(),
                                  ),
                                );
                              }, 'Explore', false)
                            ],
                          ),
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
                        // setState(() {
                        //   isLoading = false;
                        // });
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
    );
  }
}
