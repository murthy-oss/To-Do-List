// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:todov/const/colors.dart';
import 'package:todov/models/notes_model.dart';
import 'package:todov/screens/add_note_screen.dart';

class Task_Widget extends StatefulWidget {
   final Note _note;
     const Task_Widget( this._note,{super.key});
  
  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

class _Task_WidgetState extends State<Task_Widget> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return get();
  }

  Padding get() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: [
            image(),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                      widget._note.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: isDone,
                        onChanged: (value) {
                          setState(() {
                            isDone = !isDone;
                          });
                        },
                        activeColor: custom_green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget._note.subtitle,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400),
                  ),
                  const Spacer(),
                  edit_time(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget edit_time() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(
              color: custom_green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(children: [
                const Icon(
                  Icons.timelapse,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget._note.time,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap:() {
              
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>const Add_Screen(),
              ),);
            },
            child: Container(
              width: 90,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xffE2F6F1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(children: [
                  Icon(Icons.edit, color: custom_green),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'edit',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 130,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('asserts/images/${widget._note.image}.png'),
               fit: BoxFit.cover),
        ),
      ),
    );
  }
}
