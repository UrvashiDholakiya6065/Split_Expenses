import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splitexpenses_app/Db_Service/db_service.dart';
import 'package:splitexpenses_app/Models/Group_Model/group_model.dart';
import 'package:splitexpenses_app/Screens/demo1.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: Column(
        children: [
          TextFormField(controller: controller,),
          ElevatedButton(onPressed: () async {
            // DbService().insertGroup(name)
            final insertData = GroupModel(
              name: controller.text,
            );
           await DbService.instance.insertSplit(insertData.toMap());
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Demo1()));
          }, child: Text('Add')),
        ],
      ),
    );
  }
}
