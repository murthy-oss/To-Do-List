// ignore_for_file: camel_case_types, deprecated_member_use, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:todov/const/colors.dart';
import 'package:todov/screens/data/firestore.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title_widget(),
          const SizedBox(
            height: 20,
          ),
          description_widget(),
          const SizedBox(
            height: 20,
          ),
          imagess(),
          const SizedBox(
            height: 20,
          ),
          buttons(),
        ],
      )),
    );
  }

  Widget buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: custom_green, minimumSize: const Size(170, 48)),
            onPressed: () {
        Firestore_Datasource().AddNote(subtitle.text, title.text, indexx);
        Navigator.pop(context);
            },
            child: const Text(
              "Add task",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent, minimumSize: const Size(170, 48)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
      ],
    );
  }

  Container imagess() {
    return Container(
      height: 100,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
  indexx = index;
});
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    
                    border: Border.all(
                      width: 3,
                      color: (indexx == index) ? custom_green : Colors.grey,
                    )),
                width: 140,
                margin: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.asset(
                        'asserts/images/$index.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget title_widget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: title,
          focusNode: _focusNode1,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            focusColor:
                _focusNode1.hasFocus ? custom_green : const Color(0xffc5c5c5),
            labelText: "Title",
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Enter Title',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 2.0,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: custom_green,
                  width: 2.0,
                )),
          ),
        ),
      ),
    );
  }

  Widget description_widget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: subtitle,
          focusNode: _focusNode2,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            focusColor:
                _focusNode1.hasFocus ? custom_green : const Color(0xffc5c5c5),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Enter Description',
            labelText: 'Description',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 2.0,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: custom_green,
                  width: 2.0,
                )),
          ),
          maxLines: 3,
        ),
      ),
    );
  }
}
