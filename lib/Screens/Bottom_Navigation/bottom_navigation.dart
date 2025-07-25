import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Split_Controller/split_controller.dart';
import '../Group_List/group_list.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  // int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color(0xff24bda5)
  );
  final List<Widget> screens = [
    GroupList()
  ];

  // void _onItemTapped(int index) {
  //
  //     _selectedIndex = index;
  //
  // }
  final controller = Get.put(SplitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: Obx(
            () => IndexedStack(
          index: controller.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          unselectedLabelStyle:  TextStyle(color: Colors.red, fontSize: 14),
          // backgroundColor: const Color(0xff24bda5),
          // fixedColor: Colors.white,

          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.group,color: Color(0xff24bda5),), label: 'Home',),
            BottomNavigationBarItem(
              icon: Icon(Icons.business,color: Color(0xff24bda5)),
              // backgroundColor: Colors.blueAccent,
              label: 'Business',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.amber[800],
          onTap: controller.onItemTapped,
        );
      }),
    );
  }
}
