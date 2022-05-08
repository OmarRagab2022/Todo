import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateInputField extends StatelessWidget {
  final String label;
  final String textLabel;
  final Function(String) function;
  final TextEditingController controller;

  const MyDateInputField({Key? key, required this.label, required this.textLabel, required this.function, required this.controller}) : super(key: key);

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
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14
            ),
            validator: (String ?value)=>function(value!),
            onTap: (){
              showDatePicker(context: context, 
              initialDate: DateTime.now(), 
              firstDate: DateTime(2019), 
              lastDate: DateTime(2030)).then((value) {
                controller.text = DateFormat.yMMMd().format(value!);
                print(controller.text);
              });
            },
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

             suffixIcon: const Icon(Icons.date_range,color: Colors.grey,)
            ),
          )
        ],
      ),
    );
  }
}