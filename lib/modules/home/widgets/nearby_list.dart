import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/core_text.dart';
import 'package:snackees/modules/home/home_provider.dart';

class NearbyLocationList extends ConsumerWidget {
  const NearbyLocationList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeRead = ref.read(homeProvider);
    final homeWatch = ref.watch(homeProvider);

    return SizedBox(
      height: context.screenHeight * 0.05,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeRead.movieList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    homeRead.selectMovie(index);
                  },
                  child: Container(
                    width: 120,
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: homeWatch.selectedMovie == index
                          ? const Color(0xFFFECE00)
                          : const Color(0xFFF0EFFD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: customTextWidget(
                          text: homeWatch.movieList[index],
                          color: ColorConstants.blackColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ));
          }),
    );
  }
}
