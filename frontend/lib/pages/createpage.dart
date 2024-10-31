import 'package:flutter/material.dart';
import 'package:frontend/globals/globals.dart' as globals;
import 'package:frontend/pages/firstpage.dart';
import 'package:frontend/services/api.dart';

class Createpage extends StatefulWidget {
  const Createpage({super.key});

  @override
  State<Createpage> createState() => _CreatepageState();
}

class _CreatepageState extends State<Createpage> {

  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          height:  globals.screenHeight! * .5,
          width: globals.screenWidth! * .5,
          child:  Stack(
            children: [
              TextButton.icon(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const Firstpage()));
              }, label: const Text(""),icon: const Icon(Icons.arrow_back),),
              Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Enter Name",
                      hintStyle: TextStyle(color: Colors.blue)
                    ),
                  ),
                ),
            
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  child:  TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      hintText: "Enter Age",
                      hintStyle: TextStyle(color: Colors.blue)
                    ),
                  ),
                ),
            
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
                  child: TextField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      hintText: "Enter Address",
                      hintStyle: TextStyle(color: Colors.blue)
                    ),
                  ),
                ),
            
                ElevatedButton(onPressed: (){
                  var data = {
                    "name": nameController.text,
                    "age": ageController.text,
                    "address": addressController.text,
                  };
                         Api.addUserModel(data);
            
                         nameController.clear();
                         ageController.clear();
                         addressController.clear();
            
                         globals.Notif.showToast("User added Successfuly");
                }, child: const Text("Submit"))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}