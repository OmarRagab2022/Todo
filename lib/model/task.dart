class Task {
  int? id;
  String ? title;
  String ? note;
  int ? isCompleted;
  String ? date;
  String ? startTime;
  String ? endTime;
  int ? colorR;
  int ? colorG;
  int ? colorB;
  int ? remind;
  Task({
    this.colorR,
    this.colorB,
    this.colorG,
    this.date,
    this.endTime,
    this.id,
    this.isCompleted,
    this.note,
    this.remind,
    this.startTime,
    this.title,
  });

Task.fromJson(Map<String,dynamic> json){
id = json['id'] ?? '';
title = json['title'] ?? '';
note = json['note'];
isCompleted = json['isCompleted']?? '';
date = json['date'] ?? '';
startTime = json['startTime']?? '';
endTime= json['endTime'] ?? '';
remind = json['remind'] ?? '';
colorB= json['colorB'] ?? '';
colorG= json['colorG']?? '';
colorR= json['colorR']?? '';  
}
Map<String,dynamic>toMap(){
  return{
    'id':id,
    'title':title,
    'note':note,
    'isCompleted':isCompleted,
    'date':date,
    'startTime':startTime,
    'endTime':endTime,
    'remind':remind,
    'colorB':colorB,
    'colorG':colorG,
    'colorR':colorR
  };
}



}