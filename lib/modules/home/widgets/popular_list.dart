import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/widget_links.dart';
import 'package:snackees/modules/food_details/food_details_screen.dart';
import 'package:snackees/modules/home/home_provider.dart';

class PopularList extends ConsumerWidget {
  const PopularList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeRead = ref.read(homeProvider);
    return SizedBox(
      height: context.screenHeight * 0.25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeRead.popularItems.length,
          itemBuilder: (context, index) {
            var item = homeRead.popularItems[index];
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  context.pushScreenTo(FoodDetailsPage(index: index));
                },
                child: Container(
                  width: context.screenHeight * 0.21,
                  decoration: ShapeDecoration(
                    color: ColorConstants.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0xFFE9E9E9),
                        blurRadius: 50,
                        offset: Offset(0, 0),
                        spreadRadius: -10,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image.asset(
                            item.imgPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Spaces.smallh,
                        customTextWidget(
                            text: item.title,
                            fontNameP: 'Questrial',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.blackColor),
                        Spaces.smallh,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            customTextWidget(
                                text: item.speciality,
                                fontNameP: 'Questrial',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.blackColor),
                            Image.asset('assets/icons/fire.png')
                          ],
                        ),
                        Spaces.smallh,
                        customTextWidget(
                            text: 'Rs. ${item.price}',
                            fontNameP: 'Questrial',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: ColorConstants.blackColor),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
