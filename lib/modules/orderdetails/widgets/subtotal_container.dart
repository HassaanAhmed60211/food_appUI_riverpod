import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/core/core_widgets/spaces.dart';
import 'package:snackees/modules/food_details/food_det_controller.dart';
import 'package:snackees/modules/orderdetails/widgets/subtotal_textwidget.dart';

class SubTotalContainer extends ConsumerWidget {
  const SubTotalContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fdWatch = ref.watch(fdProvider);
    final fdRead = ref.read(fdProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.71, 0.71),
          end: Alignment(0.71, -0.71),
          colors: [Color(0xFFAEABEF), Color(0xFFD7CAEB)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x145A6CEA),
            blurRadius: 50,
            offset: Offset(12, 26),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            textWidgetOrder('Subtotal', fdWatch.subtotal.toString()),
            Spaces.mid,
            textWidgetOrder('Taxes and Charges', '98'),
            Spaces.mid,
            textWidgetOrder('Discount', fdWatch.discount.toString()),
            Spaces.mid,
            const Divider(
              color: ColorConstants.whiteColor,
              thickness: 1,
            ),
            Spaces.smallh,
            textWidgetOrder('Total',
                fdRead.addItem.isEmpty ? "0.0" : fdWatch.totalCart.toString()),
          ],
        ),
      ),
    );
  }
}
