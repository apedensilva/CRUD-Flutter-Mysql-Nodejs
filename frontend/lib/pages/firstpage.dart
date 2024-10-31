import 'package:flutter/material.dart';
import 'package:frontend/pages/createpage.dart';
import 'package:frontend/pages/readpage.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
       child: Container(
        decoration:const BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width * .5,
        height: MediaQuery.of(context).size.height * .5,        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              ElevatedButton.icon(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Createpage()));
              }, icon: const Icon(Icons.create) ,label: const Text('Create')),
              const Padding(padding: EdgeInsets.only(top: 20)),

              ElevatedButton.icon(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ReadPage()));
              }, icon: const Icon(Icons.read_more),label: const Text('Read')),
              const Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        
       ),
      ),
    );
  }
}