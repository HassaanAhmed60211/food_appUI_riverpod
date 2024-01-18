import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/core_text.dart';
import 'package:snackees/core/core_widgets/spaces.dart';
import 'package:snackees/modules/food_details/food_det_controller.dart';
import 'package:snackees/modules/home/home_provider.dart';

class OrderItemData extends HookConsumerWidget {
  const OrderItemData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fdRead = ref.read(fdProvider);
    final homeRead = ref.read(homeProvider);

    final fdWatch = ref.watch(fdProvider);

    return SizedBox(
      width: context.screenWidth,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorConstants.whiteColor.withOpacity(0.7)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: fdRead.addItem.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 20),
                  child: SizedBox(
                    height: context.screenHeight * 0.1,
                    child: Center(
                        child: customTextWidget(
                            text: 'No product is in the cart yet.')),
                  ))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: fdRead.addItem.length,
                  itemBuilder: (context, index) {
                    var item = fdWatch.addItem[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20),
                      child: SizedBox(
                        width: context.screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 97, child: Image.asset(item.imgPath)),
                            Spaces.smallw,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customTextWidget(
                                      text: item.title,
                                      fontNameP: 'Roboto',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ColorConstants.blackColor),
                                  Spaces.extrasmall,
                                  Row(
                                    children: [
                                      customTextWidget(
                                        text: "CUSTOMIZED",
                                        fontNameP: 'Roboto',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF7F7F7F),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: Color(0xFF7F7F7F),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (item.quantity > 1) {
                                            fdRead.qty = 0;
                                            fdRead.qty = item.quantity;
                                            fdRead.decreaseQtyCart();
                                            fdRead.addItem[index].quantity =
                                                fdRead.qty;

                                            fdRead.addItem[index].price -=
                                                homeRead
                                                    .popularItems[index].price;
                                            fdRead.calSubTotal();
                                          }
                                        },
                                        child: Container(
                                          width: 28,
                                          height: 28,
                                          padding: const EdgeInsets.all(6),
                                          decoration: ShapeDecoration(
                                            color: const Color(0x7FFED62E),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9.82),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              FontAwesome.minus_solid,
                                              color: ColorConstants.whiteColor,
                                              size: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spaces.smallw,
                                      customTextWidget(
                                          text: item.quantity,
                                          color: ColorConstants.blackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                      Spaces.smallw,
                                      GestureDetector(
                                        onTap: () {
                                          fdRead.qty = 0;
                                          fdRead.qty = item.quantity;

                                          fdRead.increaseQtyCart();
                                          fdRead.addItem[index].quantity =
                                              fdRead.qty;
                                          fdRead.addItem[index].price +=
                                              homeRead
                                                  .popularItems[index].price;
                                          fdRead.calSubTotal();
                                        },
                                        child: Container(
                                          width: 28,
                                          height: 28,
                                          padding: const EdgeInsets.all(6),
                                          decoration: ShapeDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment(-0.71, 0.71),
                                              end: Alignment(0.71, -0.71),
                                              colors: [
                                                Color(0xFFFECE00),
                                                Color(0xFFFAEEB9)
                                              ],
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9.82),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              FontAwesome.plus_solid,
                                              color: ColorConstants.whiteColor,
                                              size: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spaces.smallw,
                                      customTextWidget(
                                          text: '₹ ${item.price}',
                                          color: ColorConstants.blackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
