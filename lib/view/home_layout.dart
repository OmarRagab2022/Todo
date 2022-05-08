import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/helper/notif_helper.dart';
import 'package:todo/view/add_task.dart';
import 'package:todo/widgets/my_botton.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({ Key? key }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  DateTime _selectedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height:26),
          _appBarItem(),
          const SizedBox(height: 9,),
          addTaskItem(),
          datePickerItem(),
          const SizedBox(height: 19,),
          Center(child: listIsEmpty())
        ],
      ),
      
    );
  }
Widget datePickerItem(){
  return Container(
    
    padding: const EdgeInsets.all(5),
    child: DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),  
      height: 100,
      width: 90,
      selectedTextColor: Colors.white,
      selectionColor: Colors.blue,
      onDateChange: (newDate){
        setState(() {
          _selectedTime = newDate;
          
        });
      },    
    ),
  ); 
}


}

Widget _appBarItem(){ 
  
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(onPressed: (){
        NotifiHelper().showNotificationSc();
      }, icon: const Icon(Icons.nightlight_round),color: Colors.black,iconSize: 25,),
     const Padding(
        padding:  EdgeInsets.only(
          right: 7.4,
          top: 10.1
        ),
        child:  CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/logo.jpg'),
        ),
      )
    ],
  );
}





Widget addTaskItem(){
  return Row(
    mainAxisAlignment:MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text(DateFormat.yMMMMd().format(DateTime.now()),style: const TextStyle(
             fontSize:29,
             color:Colors.grey,
             fontStyle: FontStyle.italic
           ),),
           Text('Today',style:TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             fontStyle: FontStyle.italic
           )) 
          ],
          
        ),
         
      ),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: MyBotton(labal: '+ add Task', function: ()=>Get.to(()=>const AddTaskLayout(),transition: Transition.rightToLeftWithFade), color: Colors.blueAccent, height: 45, width:100 ),
     ) 
    ],
  );
}

Widget listIsEmpty(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children:const [
        SizedBox(height: 40,),
       Icon(Icons.task,color: Colors.grey,size: 250,),
       SizedBox(height: 9,),
       Text('Tasks is Empty',style: TextStyle(
         color: Colors.grey,
         fontSize: 50,
         fontStyle: FontStyle.italic
       ), )
    ]
  );
}




