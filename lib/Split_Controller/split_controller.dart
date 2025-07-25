
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:splitexpenses_app/Models/Group_Model/group_model.dart';

import '../Db_Service/db_service.dart';

class SplitController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxInt selectedIndex = 0.obs;
  final groupNameController = TextEditingController();
  RxList<GroupModel> groupList=<GroupModel>[].obs;



  //This is my init....................................
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }




// Bottom Nav tap................................................................
  void onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }

  //Get Group List...............................................................
  Future<void> getData() async {
    var l = await DbService.instance.getSplit();
    groupList.value = l.map((e) => GroupModel.fromMap(e)).toList();

    print("Group list::::${l.length}--${groupList.length}");
    update();
  }
}