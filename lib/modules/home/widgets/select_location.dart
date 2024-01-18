import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snackees/configs/constants/assets_configs/assets_constants.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/core_text.dart';
import 'package:snackees/core/core_widgets/custom_elevated_button.dart';
import 'package:snackees/core/core_widgets/spaces.dart';
import 'package:snackees/modules/home/home_provider.dart';
import 'package:snackees/modules/home/widgets/nearby_list.dart';
import 'package:snackees/modules/home/widgets/timing_list.dart';

class SelectLocation extends ConsumerWidget {
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeRead = ref.read(homeProvider);
    return Container(
      decoration: ShapeDecoration(
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 202),
            spreadRadius: 291,
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: ColorConstants.whiteColor,
      ),
      height: context.screenHeight * 0.47,
      width: context.screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: context.screenWidth * 0.7,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xFFF0EFFD),
                    borderRadius: BorderRadius.circular(30)),
                child: ListTile(
                  leading: SvgPicture.asset(IconsString.location_svg),
                  title: customTextWidget(
                      text: 'PVR, Jabalpur',
                      color: ColorConstants.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  trailing: SvgPicture.asset(IconsString.search_svg),
                ),
              ),
            ),
            Spaces.mid,
            customTextWidget(
                text: 'Movies',
                color: const Color(0xFF808080),
                fontSize: 14,
                fontWeight: FontWeight.w500),
            Spaces.smallh,
            const NearbyLocationList(),
            Spaces.mid,
            customTextWidget(
                text: 'Timings',
                color: const Color(0xFF808080),
                fontSize: 14,
                fontWeight: FontWeight.w500),
            Spaces.smallh,
            const TimingList(),
            Spaces.mid,
            Spaces.mid,
            Align(
              alignment: Alignment.bottomRight,
              child: customElevatedBtnWidget(
                  circlularBorderRadius: 30,
                  width: context.screenWidth * 0.27,
                  bgColor: ColorConstants.corePrimeColor,
                  child: Center(
                    child: customTextWidget(
                        text: 'Done',
                        color: ColorConstants.blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  func: () {
                    homeRead.showLocation(false);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
