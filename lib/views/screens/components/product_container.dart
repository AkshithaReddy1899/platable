import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platable/constants/app_constants.dart';

import '../../../models/product_list_model.dart';

class ProductContainer extends StatefulWidget {
  final Size containerSize;
  final double circleRadius;
  final Products product;
  const ProductContainer(
      {super.key,
      required this.containerSize,
      required this.circleRadius,
      required this.product});

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      constraints: BoxConstraints(
          maxHeight: widget.containerSize.height,
          maxWidth: widget.containerSize.width),
      width: widget.containerSize.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: widget.circleRadius / 2.0,
            ),
            child: Container(
              height: widget.containerSize.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(int.parse(widget.product.color.toString())),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff13274A).withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                    BoxShadow(
                      color: const Color(0xff13274A).withOpacity(0.1),
                      offset: const Offset(-1, 0),
                    ),
                    BoxShadow(
                      color: const Color(0xff13274A).withOpacity(0.1),
                      offset: const Offset(1, 0),
                    )
                  ]),
              child: SizedBox(
                height: widget.containerSize.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                            color: widget.product.color!.toColor(),
                          ),
                          width: widget.containerSize.width,
                          height: widget.containerSize.height / 8,
                          padding:
                              EdgeInsets.only(top: widget.circleRadius / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  color: AppConstant.primaryColor,
                                ),
                                child:
                                    Image.asset(widget.product.icon.toString()),
                              ),
                              Text(
                                widget.product.name.toString(),
                                style: TextStyle(
                                    color: widget.product.brandColor!.toColor(),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                              'assets/images/nav/bookmark.svg'),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          color: AppConstant.backgroundColor,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 32,
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                right: 20,
                              ),
                              child: Text(
                                widget.product.productName.toString(),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: AppConstant.primaryTextColor),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.product.timeSlot!.day.toString(),
                                  style: AppConstant().productSubText,
                                ),
                                AppConstant().ellipse,
                                SvgPicture.asset(
                                    'assets/images/product_icons/clock-circle.svg'),
                                Text(
                                    widget.product.timeSlot!.timeRange
                                        .toString(),
                                    style: AppConstant().productSubText)
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/product_icons/star.svg'),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  widget.product.stars.toString(),
                                  style: AppConstant().productSubText,
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
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  widget.product.distance.toString(),
                                  style: AppConstant().productSubText,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 66,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: widget.product.stock! < 2
                                        ? Colors.red
                                        : AppConstant.primaryYellow,
                                  ),
                                  child: Text(
                                    widget.product.stock! < 5
                                        ? '${int.parse(widget.product.stock.toString()).toString()} left'
                                        : '5+ left',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                        color: AppConstant.primaryColor),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$ ${widget.product.todayPrice.toString()}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff7C747E)),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      widget.product.actualPrice.toString(),
                                      style: const TextStyle(
                                          color: Color(0xff7C747E),
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  ],
                                )
                              ],
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
          Container(
            width: widget.circleRadius,
            height: widget.circleRadius,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppConstant.primaryColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                widget.product.image.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
