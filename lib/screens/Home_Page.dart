// ignore_for_file: file_names, camel_case_types, depend_on_referenced_packages


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:todov/const/colors.dart';
import 'package:todov/screens/add_note_screen.dart';
import 'package:todov/screens/data/firestore.dart';
import 'package:todov/screens/login.dart';
import 'package:todov/widgets/task_widgets.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}
bool show =true;
class _Home_PageState extends State<Home_Page> {
 final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
   void initState() {
    super.initState();
    User? user = _auth.currentUser;
    if (user == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LogIN_Screen()),
          (route) => false);
    } else {}
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton
        (onPressed: (){
            Navigator.push(context, 
                    MaterialPageRoute(
              builder:
                    (context) => const Add_Screen(),));
                    
        },
        backgroundColor: custom_green,
        child: const Icon(Icons.add,color: Colors.white,size:35,),
        ),
      ),
      body: SafeArea(
        
        child: NotificationListener<UserScrollNotification>(
          onNotification:(notification) {
            if(notification.direction==ScrollDirection.forward){
              setState(() {
                show=true;
              });
            }
            if(notification.direction==ScrollDirection.reverse){
              setState(() {
                show=false;
              });
            }
            return true;
          },
          
          child:  StreamBuilder<QuerySnapshot>(
            stream: Firestore_Datasource().stream(),
            builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return const CircularProgressIndicator();
                }
                final noteslist=Firestore_Datasource().getNotes(snapshot);
              return ListView.builder(
                    itemBuilder: (context,index){
                      final note=noteslist[index];
                    
                      return Task_Widget(note);
                    },
                    itemCount:noteslist.length,
                  );
            }
          ),
        ),
      ),
    );
    
  }
}