import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:splitexpenses_app/Screens/Group_List/group_list.dart';

import '../../Db_Service/db_service.dart';
import '../../Models/Group_Model/group_model.dart';
import '../../Split_Controller/split_controller.dart';
import '../Bottom_Navigation/bottom_navigation.dart';

class CreateGroup extends StatelessWidget {
  CreateGroup({super.key});

  final controller = Get.find<SplitController>();

  @override
  Widget build(BuildContext context) {
    // controller.showDialogBox(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create a group'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  final insertData = GroupModel(
                    name: controller.groupNameController.text,
                  );
                  await DbService.instance.insertSplit(insertData.toMap());
                  Get.offAll(BottomNavigation());
                }

              },
              icon: Icon(Icons.check, color: Color(0xff24bda5)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Color(0xff24bda5)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(CupertinoIcons.camera),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Group name'),
                          TextFormField(
                            controller: controller.groupNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter tour group name';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
