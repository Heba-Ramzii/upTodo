import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uptodo/generated/assets.dart';
import 'package:uptodo/view/pages/category/create_new_category.dart';
import 'category_box_item.dart';

class ChooseCategory extends StatefulWidget {
  const ChooseCategory({super.key});

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  int? _selectedIndex; // the index of the selected item

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0; // initially select the first item
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> icon = [
      SvgPicture.asset(
        Assets.imagesBread,
        height: 32,
        width: 32,
      ),
      const Icon(
        IconlyLight.work,
        color: Color(0xFFA31D00),
        size: 32,
      ),
      SvgPicture.asset(
        Assets.imagesGym,
          ),
      SvgPicture.asset(
        Assets.imagesDesign,
        height: 32,
        width: 32,
        ),
      const Icon(
        size: 32,
        FontAwesomeIcons.graduationCap,
        color: Color(0xFF0055A3),
      ),
      const Icon(
        size: 32,
        FontAwesomeIcons.microphoneLines,
        color: Color(0xFFA30089),
      ),
      const Icon(
        size: 32,
        FontAwesomeIcons.music,
        color: Color(0xFFA000A3),
      ),
      const Icon(
        size: 32,
        FontAwesomeIcons.heartPulse,
        color: Color(0xFF00A3A3),
      ),
      const Icon(
        size: 32,
        IconlyLight.video,
        color: Color(0xFF0069A3),
      ),
      const Icon(
        size: 32,
        IconlyLight.home,
        color: Color(0xFFA36200),
      ),
      const Icon(
        size: 32,
        Icons.add,
        color: Color(0xFF00A369),
      ),
    ];
    List<String> name =[
      "Grocery",
      "Work",
      "Sport",
      "Design",
      "University",
      "Social",
      "Music",
      "Health",
      "Movie",
      "Home",
      "Create New",
    ];
    List<Color> background = const [
      Color(0xFFCCFF80),
      Color(0xFFFF9680),
      Color(0xFF80FFFF),
      Color(0xFF80FFD9),
      Color(0xFF809CFF),
      Color(0xFFFF80EB),
      Color(0xFFFC80FF),
      Color(0xFF80FFA3),
      Color(0xFF80D1FF),
      Color(0xFFFFCC80),
      Color(0xFF80FFD1),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0,),
          child: Divider(),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 3,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 16.0
          ),
          itemCount: icon.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
               onTap: () {
                 if(index+1 == icon.length){
                   Get.to(const CreateNewCategory());
                 }
              },
              child:  CategoryBoxItem(
                   icon: icon[index],
                  name: name[index],
                  background: background[index]
              ),
            );
          },
        ),
      ],
    );
  }
}
