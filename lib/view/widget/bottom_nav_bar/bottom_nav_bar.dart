import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uptodo/core/constants/theme/theme.dart';
import 'package:uptodo/view/widget/bottom_nav_bar/nav_bar_build_item.dart';
import '../../pages/add_screen/add_screen.dart';
import '../../pages/calendar/calendar_screen.dart';
import '../../pages/focus/focus_screen.dart';
import '../../pages/home/home_screen.dart';
import '../../pages/profile/profile.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});


  @override
  Widget build(BuildContext context) {

    int selectedIndex =0;

    List<Widget> buildScreens = const[
        HomeScreen(),
        CalendarScreen(),
        AddScreen(),
        FocusScreen(),
        ProfileScreen()
      ];

    List<Widget> navBarItems = [
      NavBarBuildItem(
          label: "Home",
          icon: IconlyBold.home,
          onTap:  (){
            Get.to(const HomeScreen());
          },
      ),
      NavBarBuildItem(
          label: "Calendar",
          icon: IconlyLight.calendar,
          onTap:  (){
            Get.to(const CalendarScreen());

          },
      ),
      const SizedBox(width: 5,),
      NavBarBuildItem(
          label: "Focus",
          icon: IconlyLight.timeCircle,
          onTap:  (){
            Get.to(const FocusScreen());

          },
      ),
      NavBarBuildItem(
          label: "Profile",
          icon: IconlyLight.profile,
          onTap:  (){
            Get.to(const ProfileScreen());

          },
      ),
     ];

     return BottomAppBar(
       color: ThemeColors.dark,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children:navBarItems,
    ),
    );
  }
}