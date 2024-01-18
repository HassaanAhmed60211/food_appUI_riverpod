// ignore_for_file: must_be_immutable
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:snackees/configs/constants/color_constants.dart';
import 'package:snackees/configs/extensions/buildcontext_extensions.dart';
import 'package:snackees/modules/bottomnav/controller/nav_controller.dart';
import 'package:snackees/modules/food_details/food_details_screen.dart';
import 'package:snackees/modules/home/home_screen.dart';
import 'package:snackees/modules/orderdetails/order_details.dart';

class UserNavBar extends ConsumerWidget {
  UserNavBar({super.key});

  // final NavController nav = Get.put(NavController());
  List<IconData> iconList = [
    // AppIcons.home,
    Icons.home_filled,
    Icons.discount_outlined,
    // AppIcons.notification,
    FontAwesome.pizza_slice_solid,
    // AppIcons.profile,
    FontAwesome.bag_shopping_solid
  ];

  List children = [
    HomePage(),
    HomePage(),
    // const FavoritePage(),
    const FoodDetailsPage(index: 0),
    const OrdeDetailsPage(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navRead = ref.read(navProvider);
    final navWatch = ref.watch(navProvider);
    return Scaffold(
      extendBody: true,
      // res: false, // fluter 1.x
      resizeToAvoidBottomInset: false, // fluter 2.x
      body: Stack(
        children: [
          children[navWatch.bottomNavIndex],
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          // context.push('/filter);
          context.pushScreenTo(const FoodDetailsPage(
            index: 0,
          ));
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: ShapeDecoration(
            color: ColorConstants.corePrimeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadows: const [
              BoxShadow(
                color: ColorConstants.corePrimeColor,
                blurRadius: 24,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.local_pizza_rounded,
              size: 27,
              color: Color(0xff061737),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
          height: 65,
          icons: iconList,
          inactiveColor: const Color(0xFF9E9E9E),
          activeIndex: navWatch.bottomNavIndex,
          activeColor: const Color(0xff061737),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) async {
            navRead.updateNav(index);
          }
          //other params
          ),
    );
  }
}

class BottomNavigationBarWidget extends ConsumerWidget {
  List<IconData> iconList = [
    // AppIcons.home,
    Icons.home,
    Icons.refresh,
    // AppIcons.notification,
    Icons.notifications_none,
    // AppIcons.profile,
    FontAwesome.user
  ];

  BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navRead = ref.read(navProvider);
    final navWatch = ref.watch(navProvider);
    return AnimatedBottomNavigationBar(
      height: 65,
      icons: iconList,
      inactiveColor: const Color(0xFF9E9E9E),
      activeIndex: navWatch.bottomNavIndex,
      activeColor: const Color(0xff061737),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      // onTap: (index) => navController.updateNav(index),
      onTap: (index) {
        navRead.updateNav(index);
        Navigator.pop(context);
        // if (index == 0) {
        //   // If home icon is tapped (index 0), navigate to the home route
        //   Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //       builder: (ctx) => UserNavBar(),
        //     ), // replace with the route name for your home page
        //     (route) => false, // remove all routes from the stack
        //   );
        // } else {
        //   // For other icons, update the navigation index as usual
        //   navController.updateNav(index);
        // }
      },
      // other params

      //other params
    );
  }
}

class CartFloatingIcon extends StatelessWidget {
  const CartFloatingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.push('/filter);
        // context.push(RouterNames.myCartPage);
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: ShapeDecoration(
          color: ColorConstants.corePrimeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: const [
            BoxShadow(
              color: ColorConstants.corePrimeColor,
              blurRadius: 24,
              offset: Offset(0, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Icon(
            Icons.local_pizza_rounded,
            color: Color(0xff061737),
          ),
        ),
      ),
    );
  }
}
