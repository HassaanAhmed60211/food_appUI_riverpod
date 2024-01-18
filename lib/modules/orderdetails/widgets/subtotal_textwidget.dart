import 'package:flutter/material.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/core/core_widgets/core_text.dart';

Widget textWidgetOrder(String text, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customTextWidget(
          text: text,
          fontNameP: 'Roboto',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ColorConstants.whiteColor),
      customTextWidget(
          text: '₹ $price',
          fontNameP: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: ColorConstants.whiteColor),
    ],
  );
}
