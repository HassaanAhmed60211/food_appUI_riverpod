import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:snackees/configs/constants/assets_configs/assets_constants.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/constants/fonts_configs/fonts_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/modules/authentication/login/login_controller.dart';
import 'package:snackees/modules/bottomnav/bottom_nav.dart';
// import '';
import '/core/core_widgets/widget_links.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginRead = ref.read(loginProvider);
    final loginWatch = ref.watch(loginProvider);
    return SafeArea(
      child: BackgroundWidget(
        isScrollable: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              // color: Colors.brown.withOpacity(.6),
              height: context.screenHeight * 0.3,
              width: context.screenWidth,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 45,
                    child: SizedBox(
                      width: 240,
                      child: customTextWidget(
                        text: "Snacks at your Seat!",
                        textAlign: TextAlign.center,
                        fontNameP: FontsConstants.nabla,
                        fontSize: 34,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 80,
                    child: Image.asset(IconsString.burger_icon),
                  ),
                  Positioned(
                    // left: 0,
                    bottom: 5,
                    child: Image.asset(
                      IconsString.donut_icon,
                      height: 120,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 45,
                    child: Image.asset(IconsString.hot_dog),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        blurRadius: 4,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 55,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  loginRead.selectSwitch('signup');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: loginWatch.isSwitch == 'signup'
                                        ? ColorConstants.whiteColor
                                        : const Color(0xFFEEE5FF),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                    ),
                                  ),
                                  height: 55,
                                  child: Center(
                                    child: customTextWidget(
                                      text: "Sign up",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      lineHeight: 1.8,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  loginRead.selectSwitch('login');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: loginWatch.isSwitch == 'login'
                                        ? ColorConstants.whiteColor
                                        : const Color(0xFFEEE5FF),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                  height: 55,
                                  child: Center(
                                    child: customTextWidget(
                                      text: "Sign In",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      lineHeight: 1.8,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spaces.mid,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Row(
                          // crossAxisAlignment: ,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: customElevatedBtnWidget(
                                  circlularBorderRadius: 28,
                                  bgColor: const Color(0xFFF5F5F5),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Brand(Brands.google),
                                        Spaces.smallw,
                                        Flexible(
                                          child: customTextWidget(
                                            text: "GOOGLE",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF7B7B7B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  func: () {},
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: customElevatedBtnWidget(
                                  circlularBorderRadius: 28,
                                  bgColor: const Color(0xFFF5F5F5),
                                  child: Row(
                                    children: [
                                      Flexible(child: Brand(Brands.facebook)),
                                      Spaces.smallw,
                                      Flexible(
                                        child: customTextWidget(
                                          text: "FACEBOOK",
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF7B7B7B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  func: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spaces.mid,
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: customTextField(
                            hintText: "Email address",
                            controller: loginRead.emailController,
                            fillColor: ColorConstants.secondaryColor,
                            circularRadius: 24,
                            colorBorder: Colors.transparent,
                            color: ColorConstants.secondaryColor,
                          ),
                        ),
                      ),
                      Spaces.mid,
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: customTextField(
                            hintText: "****",
                            controller: loginRead.pwController,
                            fillColor: ColorConstants.secondaryColor,
                            circularRadius: 24,
                            colorBorder: Colors.transparent,
                            color: ColorConstants.secondaryColor,
                          ),
                        ),
                      ),
                      Spaces.mid,
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.1),
                                  blurRadius: 2,
                                  offset: const Offset(0, 9),
                                ),
                              ],
                            ),
                            child: customElevatedBtnWidget(
                              width: context.screenWidth,
                              circlularBorderRadius: 23,
                              child: Center(
                                  child: customTextWidget(
                                text: loginWatch.isSwitch == 'login'
                                    ? "Log In"
                                    : "Create Account",
                                fontSize: 17,
                                color: Colors.white,
                              )),
                              func: () {
                                context.pushScreenTo(UserNavBar());
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: context.screenHeight * 0.1,
                  width: context.screenWidth,
                  // color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
