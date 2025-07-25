
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Split_Controller/split_controller.dart';
import '../Create_Group/create_group.dart';

class GroupList extends StatelessWidget {
  GroupList({super.key});
  final controller = Get.put(SplitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            // final groups = controller.groupList.map((e) => e.group_name).toSet().toList();
            return Expanded(
              child: ListView.builder(
                itemCount: controller.groupList.length,
                itemBuilder: (context, index) {
                  // final groupName = groups[index] ?? '';
                  return InkWell(
                    onTap: () {
                      // Get.to(() => AddmemberDetails(groupName: groupName));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          height: 60,
                          width: 90,
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDk1LSphct7YSUUw7VahpGGHlxVDMgJC8zFQ&s',
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(controller.groupList[index].name),
                        subtitle: Text('Expenses'),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => CreateGroup());
              },
              child: Text('Start a new group', style: TextStyle(color: Color(0xff24bda5))),
            ),
          ),
        ],
      ),
    );
  }
}
