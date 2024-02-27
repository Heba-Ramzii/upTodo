import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/theme/theme.dart';
import 'package:uptodo/core/model/task_model.dart';
import 'package:uptodo/repo/home_repo.dart';

import '../../../controller/task_controller.dart';

class TodayTask extends StatefulWidget {
  const TodayTask({super.key});

  @override
  State<TodayTask> createState() => _TodayTaskState();
}

class _TodayTaskState extends State<TodayTask> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(HomeRepo.userModel.id!)
        .collection("tasks")
        .snapshots();
    String? dropdownvalue = 'Today';

    var items = [
      'Tomorrow',
      'Today',
      'Yesterday',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
                color: ThemeColors.dark,
                borderRadius: BorderRadius.circular(6)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                dropdownColor: ThemeColors.dark,
                borderRadius: BorderRadius.circular(6),
                value: dropdownvalue,
                style: StyleManager.textStyleDark14,
                icon: const Icon(
                  IconlyLight.arrowDown2,
                  color: ThemeColors.fontColorDark,
                  size: 16,
                ),
                items: items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (newVal) {
                  setState(() {
                    dropdownvalue = newVal;
                  });
                },
              ),
            ),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: 16,
                    ),
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  TaskModel task = TaskModel.fromJson(data);
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ThemeColors.dark,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: 0,
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.title??''
                                  ,
                                  style: StyleManager.textStyleDark16,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Text(
                                       task.date??'',
                                      style: StyleManager.textStyleDark14
                                          .copyWith(color: ThemeColors.gray),
                                    ),
                                    Container(
                                      color: Colors.cyan,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                      color: ThemeColors.primary,
                                    ))),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ],
    );
  }
}
