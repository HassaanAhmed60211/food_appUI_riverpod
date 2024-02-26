import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:snackees/configs/constants/assets_configs/assets_constants.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/constants/fonts_configs/fonts_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/widget_links.dart';
import 'package:snackees/core/models/popular_items_model.dart';
import 'package:snackees/modules/food_details/food_det_controller.dart';
import 'package:snackees/modules/home/home_provider.dart';
import 'package:snackees/modules/orderdetails/order_details.dart';

class FoodDetailsPage extends HookConsumerWidget {
  final int index;
  const FoodDetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeRead = ref.read(homeProvider);
    final fdRead = ref.read(fdProvider);
    final fdWatch = ref.watch(fdProvider);
    useEffect(() {
      fdRead.qty = 1;
      fdRead.totalPrice =
          double.parse(homeRead.popularItems[index].price.toString());
      fdRead.price =
          double.parse(homeRead.popularItems[index].price.toString());
      return () {
        fdRead.qty = 1;
      };
    }, []);
    return SafeArea(
        child: BackgroundWidget(
            backImage: IconsString.back_btn,
            forwardImage: IconsString.heart,
            forwardbtnColor: ColorConstants.corePrimeColor,
            isAppBar: true,
            isScrollable: true,
            child: SafeArea(
              child: SingleChildScrollView(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Spaces.mid,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: customTextWidget(
                          text: homeRead.popularItems[index].title,
                          fontSize: 40,
                          fontNameP: "Questrial",
                          color: const Color(0xFF061737),
                        ),
                      ),
                    ),
                    Spaces.smallh,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: customTextWidget(
                          text: 'Rs. ${fdWatch.totalPrice}',
                          fontSize: 29,
                          fontNameP: "Questrial",
                          color: const Color(0xFF061737),
                        ),
                      ),
                    ),
                    Spaces.large,
                    Spaces.large,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: customTextWidget(
                          text: 'Size',
                          fontSize: 18,
                          fontNameP: "Questrial",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Spaces.smallh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: homeRead.popularItems[index].sizes
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 12,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            fdRead.selectSize(e);
                                          },
                                          child: Container(
                                            height: 31,
                                            width: 31,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: fdWatch.selectedSize == e
                                                    ? const Color(0xFFFBD224)
                                                    : ColorConstants
                                                        .whiteColor),
                                            child: Center(
                                              child: customTextWidget(
                                                text: e,
                                                fontSize: 15,
                                                fontNameP:
                                                    FontsConstants.questerial,
                                                color: const Color(0xFF061737),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Hero(
                              tag: homeRead.popularItems[index].title,
                              child: Image.asset(
                                homeRead.popularItems[index].imgPath,
                                height: context.screenHeight * 0.34,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // Spaces.large,
                    // Spaces.large,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: customTextWidget(
                          text: 'Quantity',
                          fontSize: 18,
                          fontNameP: FontsConstants.questerial,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Spaces.smallh,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              fdRead.decreaseQty();
                            },
                            child: Container(
                              height: 31,
                              width: 31,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                          Spaces.smallw,
                          customTextWidget(text: fdWatch.qty),
                          Spaces.smallw,
                          GestureDetector(
                            onTap: () {
                              fdRead.increaseQty();
                            },
                            child: Container(
                              height: 31,
                              width: 31,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorConstants.corePrimeColor,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spaces.large,
                    // Spaces.large,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                EvaIcons.star,
                                color: ColorConstants.corePrimeColor,
                              ),
                              Spaces.smallw,
                              customTextWidget(
                                  text: homeRead.popularItems[index].rating),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                MingCute.fire_line,
                                color: ColorConstants.whiteColor,
                              ),
                              Spaces.smallw,
                              customTextWidget(
                                  text: homeRead.popularItems[index].cal),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                EvaIcons.clock,
                                color: ColorConstants.whiteColor,
                              ),
                              Spaces.smallw,
                              customTextWidget(
                                text: homeRead.popularItems[index].cookingTime,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spaces.mid,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: customTextWidget(
                          text: 'Details',
                          fontSize: 29,
                          fontNameP: FontsConstants.questerial,
                          color: const Color(0xFF061737),
                        ),
                      ),
                    ),

                    Spaces.smallh,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 3),
                      child: Align(
                        child: customTextWidget(
                          text: homeRead.popularItems[index].details,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontNameP: FontsConstants.questerial,
                          color: const Color(0xFF061737),
                        ),
                      ),
                    ),

                    // Spaces.mid,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12),
                      child: customElevatedBtnWidget(
                          width: context.screenWidth,
                          // height: context.screenHeight * 0.4,
                          bgColor: ColorConstants.corePrimeColor,
                          child: customTextWidget(
                              text: "Add to Cart", color: Colors.white),
                          func: () {
                            var item = PopularSingleItem(
                                title: homeRead.popularItems[index].title,
                                speciality:
                                    homeRead.popularItems[index].speciality,
                                price: fdRead.totalPrice,
                                sizes: fdRead.selectedSize,
                                imgPath: homeRead.popularItems[index].imgPath,
                                quantity: fdRead.qty,
                                rating: homeRead.popularItems[index].rating,
                                cal: homeRead.popularItems[index].cal,
                                cookingTime:
                                    homeRead.popularItems[index].cookingTime,
                                details: homeRead.popularItems[index].details);
                            fdRead.addItem.add(item);
                            fdRead.calSubTotal();
                            context.pushScreenTo(const OrdeDetailsPage());
                          }),
                    ),
                    Spaces.large,
                    Spaces.large,
                    Spaces.large,
                    Spaces.large,
                    Spaces.large,
                  ],
                ),
              ),
            )));
  }
}
