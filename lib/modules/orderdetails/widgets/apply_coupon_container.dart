import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/core_text.dart';
import 'package:snackees/core/core_widgets/spaces.dart';
import 'package:snackees/modules/orderdetails/widgets/btmsheet_coupon.dart';

class ApplyCouponContainer extends ConsumerWidget {
  const ApplyCouponContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.screenWidth,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.699999988079071),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: 40,
                    child: Image.asset('assets/icons/discount.png')),
                Spaces.midw,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextWidget(
                        text: 'Apply Coupon',
                        fontNameP: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.blackColor),
                    Spaces.extrasmall,
                    customTextWidget(
                        text: 'Save Rs.50 with NEWUSER',
                        fontNameP: 'Roboto',
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff808080))
                  ],
                ),
                SizedBox(
                  width: context.screenWidth * 0.25,
                ),
                GestureDetector(
                  onTap: () {
                    btmSheetCoupon(context, ref);
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Color(0xff808080),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
