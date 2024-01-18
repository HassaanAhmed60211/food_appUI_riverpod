import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/core/core_widgets/core_text.dart';
import 'package:snackees/modules/home/home_provider.dart';

class TimingList extends ConsumerWidget {
  const TimingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeRead = ref.read(homeProvider);
    final homeWatch = ref.watch(homeProvider);
    return SizedBox(
        height: context.screenHeight * 0.07,
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(6, (index) {
            return GestureDetector(
                onTap: () {
                  homeRead.selectTime(index);
                  debugPrint(homeRead.seletedTime.toString());
                },
                child: Container(
                  width: 90,
                  height: 30,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: homeWatch.seletedTime == index
                        ? const Color(0xFFFECE00)
                        : const Color(0xFFF0EFFD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: customTextWidget(
                        text: homeWatch.timing[index],
                        color: ColorConstants.blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ));
          }),
        ));
  }
}
