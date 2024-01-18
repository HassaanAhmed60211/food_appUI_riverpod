import 'package:flutter/material.dart';
import 'package:snackees/configs/constants/assets_configs/assets_constants.dart';
import 'package:snackees/core/core_widgets/widget_links.dart';
import 'package:snackees/modules/orderdetails/widgets/apply_coupon_container.dart';
import 'package:snackees/modules/orderdetails/widgets/make_payment.dart';
import 'package:snackees/modules/orderdetails/widgets/order_item.dart';
import 'package:snackees/modules/orderdetails/widgets/subtotal_container.dart';

class OrdeDetailsPage extends StatelessWidget {
  const OrdeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundWidget(
          isOrder: true,
          isforwardButton: false,
          isIconOne: false,
          isIconTwo: false,
          isAppBar: true,
          title: 'Order details',
          fontsize: 26,
          fontWeight: FontWeight.w600,
          backImage: IconsString.back_btn,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    Spaces.mid,
                    OrderItemData(),
                    Spaces.mid,
                    ApplyCouponContainer(),
                    Spaces.mid,
                    SubTotalContainer(),
                    Spaces.mid,
                    MakePaymentContainer(),
                    Spaces.large,
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
