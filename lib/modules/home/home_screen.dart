import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/core/core_widgets/widget_links.dart';
import 'package:snackees/modules/home/home_provider.dart';
import 'package:snackees/modules/home/widgets/categories_list.dart';
import 'package:snackees/modules/home/widgets/popular_list.dart';
import 'package:snackees/modules/home/widgets/select_location.dart';

// ignore: must_be_immutable
class HomePage extends ConsumerWidget {
  HomePage({super.key});

  bool isLocationShow = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeWatch = ref.watch(homeProvider);
    return SafeArea(
        child: BackgroundWidget(
      isScrollable: true,
      isIconOne: true,
      isIconTwo: true,
      fontsize: 16,
      fontWeight: FontWeight.w500,
      isAppBar: true,
      title: 'PVR, Jabalpur',
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spaces.large,
                Spaces.large,
                Spaces.large,
                customTextWidget(
                  text: 'Get your food',
                  fontNameP: 'Questrial',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9E9E9E),
                ),
                Spaces.smallh,
                customTextWidget(
                  text: 'Delivered!',
                  fontNameP: 'Questrial',
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.blackColor,
                ),
                Spaces.mid,
                customTextWidget(
                  text: 'Catagories',
                  fontNameP: 'Questrial',
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: ColorConstants.blackColor,
                ),
                Spaces.mid,
                const CategoryList(),
                Spaces.large,
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextWidget(
                        text: 'Popular Now',
                        fontNameP: 'Questrial',
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: ColorConstants.blackColor,
                      ),
                      customTextWidget(
                        text: 'View all',
                        fontNameP: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.blackColor,
                      ),
                    ],
                  ),
                ),
                Spaces.mid,
                const PopularList(),
                Spaces.mid,
              ],
            ),
            Visibility(
              visible: homeWatch.isLocationShow,
              child: const Padding(
                padding: EdgeInsets.only(right: 25.0, top: 70),
                child: SelectLocation(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
