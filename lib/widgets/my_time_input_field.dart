import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTimeInputField extends StatelessWidget {
  final String label;
  final String textLabel;
  final Function(String) function;
  final TextEditingController controller;

  const MyTimeInputField({Key? key, required this.label, required this.textLabel, required this.function, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic
          ),),
          const SizedBox(height: 20,),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            validator: (String ?value)=>function(value!),
            onTap: (){
             final DateTime now = DateTime.now();
             
         
             showTimePicker(context: context, initialTime: TimeOfDay(hour: now.hour, minute: now.minute)).then((value) {
               controller.text = value!.format(context);
               print(controller.text);
             });
            },
            style:const TextStyle(
              color: Colors.grey,
              fontSize: 14
            ),
            decoration: InputDecoration(
              labelText: textLabel,
              
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.black45)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.black45)
              ),
             suffixIcon: const Icon(Icons.lock_clock,color: Colors.grey,)

            ),
          )
        ],
      ),
    );
  }
}