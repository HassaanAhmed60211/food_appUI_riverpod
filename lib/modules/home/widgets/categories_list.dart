import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/core/core_widgets/widget_links.dart';
import 'package:snackees/modules/home/home_provider.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeRead = ref.read(homeProvider);
    final homeWatch = ref.watch(homeProvider);
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeRead.categoryList.length,
          itemBuilder: (context, index) {
            var item = homeRead.categoryList[index];
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: GestureDetector(
                onTap: () {
                  homeRead.selectCategory(index);
                },
                child: Container(
                  width: 110,
                  height: 150,
                  decoration: ShapeDecoration(
                    color: homeWatch.selectedCat == index
                        ? const Color(0xFFFECE00)
                        : ColorConstants.whiteColor,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(item.image),
                      ),
                      Spaces.smallh,
                      customTextWidget(
                          text: item.title,
                          fontNameP: 'Questrial',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.blackColor),
                      Spaces.smallh,
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: homeWatch.selectedCat == index
                            ? ColorConstants.whiteColor
                            : const Color(0xFFFECE00),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorConstants.blackColor,
                            size: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
