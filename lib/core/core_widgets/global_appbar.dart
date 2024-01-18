import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snackees/configs/constants/assets_configs/assets_constants.dart'
    as img;
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/widget_links.dart';
import 'package:snackees/modules/home/home_provider.dart';

class GlobalAppBar extends ConsumerWidget {
  const GlobalAppBar({
    super.key,
    this.title,
    this.titleFontSize,
    this.fontWeightTitle,
    this.forwardColor,
    this.isIconeOne,
    this.isIconeTwo,
    this.backbuttonImage,
    this.forwardButtonImage,
    this.isOrder,
    this.isforwardButton,
  });
  final String? title;
  final String? backbuttonImage;
  final String? forwardButtonImage;
  final bool? isIconeOne;
  final bool? isOrder;
  final Color? forwardColor;
  final bool? isIconeTwo;
  final bool? isforwardButton;
  final double? titleFontSize;
  final FontWeight? fontWeightTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeRead = ref.read(homeProvider);
    final homeWatch = ref.watch(homeProvider);

    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: isOrder == true ? false : true,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: isOrder == true
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                context.popFromScreen();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Image.asset(backbuttonImage!),
                ),
              ),
            ),
            isOrder == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: customTextWidget(
                        fontNameP: 'Roboto',
                        text: title ?? 'weefwf',
                        fontSize: titleFontSize!,
                        fontWeight: fontWeightTitle!,
                        color: ColorConstants.blackColor),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: isIconeOne!,
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: SvgPicture.asset(img.IconsString.location_svg),
                        ),
                      ),
                      Spaces.extrasmallw,
                      customTextWidget(
                          fontNameP: 'Roboto',
                          text: title ?? 'weefwf',
                          fontSize: titleFontSize!,
                          fontWeight: fontWeightTitle!,
                          color: ColorConstants.blackColor),
                      Spaces.extrasmallw,
                      Visibility(
                        visible: isIconeTwo!,
                        child: GestureDetector(
                          onTap: () {
                            if (homeRead.isLocationShow == true) {
                              homeRead.showLocation(false);
                            } else {
                              homeRead.showLocation(true);
                            }
                          },
                          child: SizedBox(
                            width: 22,
                            height: 22,
                            child: Icon(
                              homeWatch.isLocationShow == true
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: ColorConstants.corePrimeColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            Visibility(
              visible: isforwardButton!,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: forwardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Image.asset(forwardButtonImage!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
