import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/core_text.dart';
import 'package:snackees/core/core_widgets/custom_elevated_button.dart';
import 'package:snackees/core/core_widgets/custom_field.dart';
import 'package:snackees/core/core_widgets/spaces.dart';
import 'package:snackees/modules/food_details/food_det_controller.dart';

Future btmSheetCoupon(BuildContext context, WidgetRef ref) {
  final fdRead = ref.read(fdProvider);

  return showModalBottomSheet(
    backgroundColor: ColorConstants.whiteColor,
    context: context,
    builder: (context) {
      return SizedBox(
        height: context.screenHeight * 0.8,
        width: context.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextWidget(
                  text: "Enter your coupon code",
                  fontWeight: FontWeight.w700,
                  fontSize: 19),
              Spaces.mid,
              customTextField(
                  controller: fdRead.cpnController,
                  hintText: "Enter your coupon code"),
              Spaces.large,
              customElevatedBtnWidget(
                  width: context.screenWidth,
                  child: customTextWidget(
                      text: "Done",
                      color: ColorConstants.whiteColor,
                      fontSize: 17),
                  func: () {
                    fdRead.appluCpnCode(fdRead.cpnController.text);
                    fdRead.calSubTotal();
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
      );
    },
  );
}
