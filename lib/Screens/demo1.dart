import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splitexpenses_app/Db_Service/db_service.dart';
import 'package:splitexpenses_app/Models/Group_Model/group_model.dart';

class Demo1 extends StatefulWidget {
  const Demo1({super.key});

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
  }
  List<GroupModel> groupList=[];
  Future<void> getData() async {
    var l = await DbService.instance.getSplit();
   setState(() {
     groupList = l.map((e) => GroupModel.fromMap(e)).toList();
   });

    print("Split list::::${l.length}--${groupList.length}");
    // update();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: Column(
        children: [
          Text('sndkjsjkdfnsjkdnfkjsdnfknsdknfkdsnfnkds')
        ],
      ),
      // body: ListView.builder(
      //     itemCount: 0,
      //     itemBuilder: (context,index){
      //   return Text(groupList[index].name);
      // }),
    );
  }
}
