import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/core_text.dart';
import 'package:snackees/core/core_widgets/spaces.dart';
import 'package:snackees/modules/food_details/food_det_controller.dart';

class MakePaymentContainer extends ConsumerWidget {
  const MakePaymentContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fdWatch = ref.watch(fdProvider);
    final fdRead = ref.read(fdProvider);

    return Container(
        height: context.screenHeight * 0.08,
        width: context.screenWidth,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              color: ColorConstants.whiteColor,
              width: context.screenWidth * 0.44,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextWidget(
                        text:
                            '₹ ${fdRead.addItem.isEmpty ? "0.0" : fdWatch.totalCart}',
                        fontNameP: 'Roboto',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.blackColor),
                    Spaces.extrasmall,
                    SizedBox(
                      height: context.screenHeight * 0.02,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          customTextWidget(
                            text: "VIEW PAYMENT OPTIONS",
                            fontNameP: 'Roboto',
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF7F7F7F),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Color(0xFF7F7F7F),
                            size: 17,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: ColorConstants.corePrimeColor,
              width: context.screenWidth * 0.43,
              child: Center(
                child: customTextWidget(
                    text: 'MAKE PAYMENT',
                    fontNameP: 'Roboto',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: ColorConstants.whiteColor),
              ),
            ),
          ],
        ));
  }
}
