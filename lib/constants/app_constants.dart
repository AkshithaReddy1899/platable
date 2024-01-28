import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platable/services/providers/cart_provider.dart';
import 'package:platable/views/screens/bag_screen.dart';

class AppConstant {
  static Color primaryColor = const Color(0xffEADFEA);
  static Color secondaryColor = const Color(0xff8636BB);
  static Color lightSecondaryColor = const Color(0xffE3B5FF);
  static Color secondaryTextColor = const Color(0xff7C747E);
  static Color backgroundColor = const Color(0xffFFFBFF);
  static Color primaryTextColor = const Color(0xff1D1B1E);
  static Color thirdTextColor = const Color(0xff7C747E);
  static Color primaryYellow = const Color(0xffFBBC05);
  static Color unratedYellow = const Color(0xffF6EFF3);
  static Color fouthTextColor = const Color(0xff7F7667);

  TextStyle kRF16 = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  TextStyle productSubText = const TextStyle(
      color: Color(0xff7C747E), fontSize: 10, fontWeight: FontWeight.w500);

  TextStyle kRF16c747e = const TextStyle(
      color: Color(0xff7C747E), fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle kRF12c747e = const TextStyle(
      color: Color(0xff7C747E), fontSize: 12, fontWeight: FontWeight.w500);

  var ellipse = Container(
    width: 4,
    height: 4,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      color: Color(0xff7C747E),
    ),
  );

  TextStyle kRF16C1d1be = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: primaryTextColor);

  var boxDecoration = (Color color) {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      color: color,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 8.0,
          offset: Offset(0.0, 5.0),
        ),
      ],
    );
  };

  var widgetforkRF16C1d1be = (String label) {
    return Text(
      label,
      style: AppConstant().kRF16C1d1be,
    );
  };

  var widgetforproductSideHeading =
      (String svgPath, Size screenSize, String label, Widget icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppConstant.primaryTextColor,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          ],
        ),
        icon,
      ],
    );
  };

  var commonHeadingText = (label) {
    return Text(
      label,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppConstant.primaryTextColor),
    );
  };

  var sideHeadings = (Size screenSize, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: screenSize.height / 60,
        ),
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppConstant.primaryTextColor),
        ),
        SizedBox(
          height: screenSize.height / 30,
        )
      ],
    );
  };

  commonButton(onPressed, label, isDisabled) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
            AppConstant.secondaryColor.withOpacity(0.1)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(
            isDisabled ? Colors.grey : AppConstant.secondaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: AppConstant.secondaryColor),
          ),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  var appBar = (context, isMainScreen, CartProvider cartProvider, onbackPress,
      label, double leadingWidth) {
    return AppBar(
      backgroundColor: AppConstant.backgroundColor,
      leadingWidth: leadingWidth,
      leading: isMainScreen
          ? Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/images/Logo.svg'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff7C747E)),
                      ),
                      Row(
                        children: [
                          Text(
                            'Dubai',
                            style: AppConstant().kRF16C1d1be,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset('assets/images/arrow_down.svg')
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          : Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: onbackPress,
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  width: 15,
                ),
                AppConstant().widgetforkRF16C1d1be(label),
              ],
            ),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 10),
          child: SvgPicture.asset('assets/images/notification.svg'),
        ),
        Container(
          padding: const EdgeInsets.only(left: 5, right: 15),
          child: cartProvider.cartItems.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BagScreen(),
                      ),
                    );
                  },
                  child: Badge(
                    label: Text(cartProvider.cartItems.length.toString()),
                    child: Container(
                      padding: const EdgeInsets.only(left: 5, right: 15),
                      child: SvgPicture.asset('assets/images/ecommerce.svg'),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BagScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, right: 15),
                    child: SvgPicture.asset('assets/images/ecommerce.svg'),
                  ),
                ),
        ),
      ],
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
    );
  };

  Widget loadingIndicator(isLoading) {
    return isLoading
        ? SizedBox(
            width: 50.0,
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppConstant.primaryColor,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
