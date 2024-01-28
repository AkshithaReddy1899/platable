import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:platable/constants/app_constants.dart';
import 'package:platable/models/product_list_model.dart';

class ProductReviews extends StatefulWidget {
  final Products product;
  const ProductReviews({super.key, required this.product});

  @override
  State<ProductReviews> createState() => _ProductReviewsState();
}

class _ProductReviewsState extends State<ProductReviews> {
  @override
  Widget build(BuildContext congtext) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: widget.product.stars,
                        style: TextStyle(
                            fontSize: 46, color: AppConstant.primaryTextColor),
                      ),
                      TextSpan(
                        text: '/5',
                        style: TextStyle(
                            fontSize: 28, color: AppConstant.primaryTextColor),
                      ),
                    ]),
                  ),
                  Text(
                    'Based on 60 reviews',
                    style: TextStyle(
                        fontSize: 12, color: AppConstant.thirdTextColor),
                  ),
                  RatingBarIndicator(
                    rating: double.parse(widget.product.stars.toString()),
                    itemBuilder: (context, index) => Icon(
                      Icons.star_purple500_outlined,
                      color: AppConstant.primaryYellow,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    unratedColor: AppConstant.unratedYellow,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              SizedBox(width: 10,),
              Expanded(
                child: SizedBox(
                  // width: 120,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      chartRow(context, '5', 89),
                      chartRow(context, '4', 8),
                      chartRow(context, '3', 2),
                      chartRow(context, '4', 1),
                      chartRow(context, '1', 0),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              height: 250,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.product.reviews!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                        color: AppConstant.primaryColor),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.product.reviews![index].name!.firstName![0].toString().toUpperCase()}${widget.product.reviews![index].name!.lastName![0].toString().toUpperCase()} ',
                                          style: TextStyle(
                                              color:
                                                  AppConstant.secondaryColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  AppConstant().widgetforkRF16C1d1be(
                                      '${widget.product.reviews![index].name!.firstName.toString()} ${widget.product.reviews![index].name!.lastName.toString()}'),
                                ],
                              ),
                              Column(
                                children: [
                                  RatingBarIndicator(
                                    rating: widget.product.reviews![index].reviewStars!,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_purple500_outlined,
                                      color: AppConstant.primaryYellow,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    unratedColor: AppConstant.unratedYellow,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    widget.product.reviews![index].time.toString(),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: AppConstant.fouthTextColor),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: screenSize.width,
                            child: Text(
                              '"${widget.product.reviews![index].comment}"',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4B454D)),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget chartRow(BuildContext context, String label, int pct) {
    return Row(
      children: [
        Text('$label star'),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
          child: Stack(
            children: [
              Container(
                width: 80,
                height: 3,
                decoration: BoxDecoration(
                    color: AppConstant.unratedYellow,
                    borderRadius: BorderRadius.circular(40)),
              ),
              Container(
                width: 80 * (pct / 100) * 0.7,
                height: 3,
                decoration: BoxDecoration(
                    color: AppConstant.secondaryColor,
                    borderRadius: BorderRadius.circular(40)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
