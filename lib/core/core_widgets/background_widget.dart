import 'package:flutter/material.dart';
import 'package:snackees/configs/constants/assets_configs/assets_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/widget_links.dart';

// ignore: must_be_immutable
class BackgroundWidget extends StatelessWidget {
  Widget child;
  String? title;
  double? fontsize;
  FontWeight? fontWeight;
  bool? isAppBar;
  bool? isIconOne;
  bool? isIconTwo;
  bool? isOrder;
  String? backImage;
  String? forwardImage;
  bool? isforwardButton;
  bool? isScrollable;
  Color? forwardbtnColor;
  BackgroundWidget(
      {super.key,
      required this.child,
      this.title,
      this.isOrder = false,
      this.isAppBar = false,
      this.isIconOne = false,
      this.isScrollable = false,
      this.isIconTwo = false,
      this.isforwardButton = true,
      this.backImage = 'assets/icons/options_icon.png',
      this.forwardImage = 'assets/icons/voice_command.png',
      this.forwardbtnColor = Colors.white,
      this.fontWeight,
      this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Column(
            children: [
              Spaces.smallh,
              Visibility(
                visible: isAppBar!,
                child: GlobalAppBar(
                  isOrder: isOrder,
                  isforwardButton: isforwardButton,
                  backbuttonImage: backImage,
                  forwardButtonImage: forwardImage,
                  forwardColor: forwardbtnColor,
                  isIconeOne: isIconOne,
                  isIconeTwo: isIconTwo,
                  title: title ?? '',
                  fontWeightTitle: fontWeight ?? FontWeight.w500,
                  titleFontSize: fontsize ?? 14,
                ),
              ),
            ],
          )),
      body: isScrollable!
          ? SingleChildScrollView(
              child: Container(
                height: context.screenHeight,
                width: context.screenWidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(ImagesString.background_image),
                  fit: BoxFit.cover,
                )),
                child: child,
              ),
            )
          : Container(
              height: context.screenHeight,
              width: context.screenWidth,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(ImagesString.background_image),
                fit: BoxFit.cover,
              )),
              child: child,
            ),
    );
  }
}
