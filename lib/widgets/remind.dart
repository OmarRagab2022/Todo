import 'package:flutter/material.dart';

class RemindItem extends StatefulWidget {
  final String label;
  final Function(int) function;
  final int remindIndex;

  const RemindItem({Key? key, required this.label,required this.function,required this.remindIndex}) : super(key: key);

  @override
  State<RemindItem> createState() => _RemindItemState();
}

class _RemindItemState extends State<RemindItem> {
 final list = [5,10,15];
  
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black45
          ),),
          const SizedBox(height: 6,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: .6)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 9.1),
              child: DropdownButton<int>(
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                value: widget.remindIndex,
                items: list.map(buildMenuItem).toList(), 
              onChanged:(int ?index)=> widget.function(index!)),
            ),
          )
        ],
      ),
    );
  }
DropdownMenuItem<int> buildMenuItem(int item)=>DropdownMenuItem(
  value: item,
  child: Text('${item} minutes early'));

}