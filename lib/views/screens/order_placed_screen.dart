import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/app_constants.dart';
import '../../services/state_management.dart';
import 'home_screen.dart';

class OrderPlaced extends ConsumerStatefulWidget {
  const OrderPlaced({super.key});

  @override
  ConsumerState<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends ConsumerState<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final cartProvider = ref.watch(cartRiverpod);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      appBar: AppConstant().appBar(context, false, cartProvider, () {
        Navigator.pop(context);
      }, 'Payment', 130),
      body: SafeArea(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Color(0xff13274A)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        color: const Color(0xff13274A),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  color: AppConstant.primaryColor),
                              child: Image.asset(
                                  'assets/images/product_icons/just_salad.png'),
                            ),
                            Text(
                              'Just Salad',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: AppConstant.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Moderen Greek Crunch',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppConstant.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: screenSize.width / 10, right: screenSize.width / 10),
                width: screenSize.width,
                height: screenSize.height / 1.4,
                decoration:
                    AppConstant().boxDecoration(AppConstant.primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenSize.height / 10,
                    ),
                    SvgPicture.asset('assets/images/thankyou.svg'),
                    SizedBox(
                      height: screenSize.height / 30,
                    ),
                    const Text('Thanks for your order',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: screenSize.height / 60,
                    ),
                    const Text(
                      "You are a food waste warrior and see you in the next order",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                AppConstant.primaryColor.withOpacity(0.1)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                AppConstant.primaryColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.black87),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 132, 135, 137),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Continue saving food',
                            style: TextStyle(
                                color: AppConstant.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height / 30,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
