import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/helper/db_helper.dart';
import 'package:todo/model/task.dart';

class TaskController extends GetxController{

 bool isLoading = false;  
void isLoadingChange(){
isLoading != isLoading;
update();
}

addTaskToDb(Task task)async{

 await DBHelper().insert(task).then((value) {
   print(value);
 }).catchError((error){
   print(error);
 });
  
}
 
  
 
}

