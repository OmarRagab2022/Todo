import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/%60viewModel/task_view_model.dart';
import 'package:todo/model/task.dart';
import 'package:todo/widgets/my_botton.dart';
import 'package:todo/widgets/my_date_input_field.dart';
import 'package:todo/widgets/my_input_feild.dart';
import 'package:todo/widgets/my_time_input_field.dart';
import 'package:todo/widgets/remind.dart';

class AddTaskLayout extends StatefulWidget {
  const AddTaskLayout({ Key? key }) : super(key: key);

  @override
  State<AddTaskLayout> createState() => _AddTaskLayoutState();
}

class _AddTaskLayoutState extends State<AddTaskLayout> {
  var fromKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController stratedController = TextEditingController();
  TextEditingController endedController = TextEditingController();
  int remindIndex= 5;
  @override
  Widget build(BuildContext context) {
    dateTimeController.text = DateFormat.yMMMd().format(DateTime.now());
    TimeOfDay time = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    TimeOfDay timeE = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute+15);
    stratedController.text = time.format(context);
    endedController.text =timeE.format(context);
    int selectedIndex =1;
  Color blue = Color.fromRGBO(7, 30, 235, 1);
  Color yellow = Color.fromRGBO(227, 252, 0, 1);
  Color pink = Color.fromRGBO(242, 2, 2, 1);
  
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Form(
          key: fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              _appBarTask(),
              const SizedBox(height: 10,),
              MyInputFeild(label: 'Title', textLabel: 'Enter your Title', function: (String value){
                if(value.isEmpty){
                  return 'Please enter title';
                }
                return null;
              }, controller: titleController),
              const SizedBox(height: 9,),
              MyInputFeild(label: 'Note', textLabel: 'Enter your Note', function: (String value){
                if(value.isEmpty){
                  return 'Please enter note';
                }
                return null;

              }, controller: noteController),
              const SizedBox(height: 9,),
              MyDateInputField(label: 'Date', textLabel: dateTimeController.text, function: (String value){
                if(value.isEmpty){
                  return 'Please enter date';
                }
                return null;
              }, controller: dateTimeController),
              const SizedBox(height: 9,),
              Row(
                children: [
                  Expanded(child: MyTimeInputField(controller: stratedController,label: 'Start Time',function: (String value){
                    if(value.isEmpty){
                  return 'Please enter startTime';
                }
                return null;
                  },textLabel: stratedController.text,)),
                 Expanded(child: MyTimeInputField(controller: endedController,label: 'End Time',function: (String value){
                   if(value.isEmpty){
                  return 'Please enter endTime';
                }
                return null;
                 },textLabel: endedController.text,)) 
                ],
              ),
              const SizedBox(height: 4,),
              RemindItem(
                label: 'Remind',
                function: (int index){
                 setState(() {
                   remindIndex = index;
                 });
                 print(remindIndex); 
                },
                remindIndex: remindIndex,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
               children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text('Color',style: TextStyle(
                     color: Colors.black45,
                     fontSize: 19,
                     fontWeight: FontWeight.w500,
                     fontStyle: FontStyle.italic
                   ), ),
                   const SizedBox(height: 4,),
                  Wrap(
                    children: List.generate(3, (index) =>Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            selectedIndex = index;
                            print(selectedIndex);
                          },
                          child: CircleAvatar(
                            backgroundColor: index == 0? blue:index == 1 ?yellow: pink,
                            child: selectedIndex == index ? const Icon(
                              Icons.done,
                              size: 16,
                              color: Colors.white,
                            ) : null,
                          ),
                        ),
                       const  SizedBox(width: 9,)
                      ],
                    )),
                  ),
        
                 ],
               ),
          Spacer(),
           GetBuilder<TaskController>(
             init: TaskController(),
             builder:(controller)=> Padding(
               padding: const EdgeInsets.only(top: 20),
               child: MyBotton(labal: 'create Task', function: (){
                 if(fromKey.currentState!.validate()){
                 int r = selectedIndex  == 0 ? 7: selectedIndex == 1 ? 227 :242;
                 int b = selectedIndex  == 0 ? 7: selectedIndex == 1 ? 227 :242;
                 int g = selectedIndex  == 0 ? 7: selectedIndex == 1 ? 227 :242;
               
                 
                 controller.addTaskToDb( Task(
                   note: noteController.text.trim(),
                   title: titleController.text.trim(),
                   colorB: b,
                   colorG: g,
                   colorR: r,
                   endTime: endedController.text.trim(),
                   startTime: stratedController.text.trim(),
                   isCompleted: 0,
                   remind: remindIndex,
                   date: dateTimeController.text.trim()
                   
                 ));
                 }
               }, color: Color.fromRGBO(6, 11, 162, 1), height: 40, width: 90),
             ),
           )
        
               ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }



}

Widget _appBarTask(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackButton(onPressed: () =>Get.back() ,color: Colors.black54, ),
         const Text('add Task',style: TextStyle(
           color: Colors.black45,
           fontWeight: FontWeight.w500,
           fontSize: 20 ,
           fontStyle: FontStyle.italic
         ),), 
        const CircleAvatar(
          radius: 19,
          backgroundImage: AssetImage('assets/images/logo.jpg'),
        )
      ],
    ),
  );
}