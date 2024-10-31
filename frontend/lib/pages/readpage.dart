// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend/services/api.dart';
import '../services/api.dart'; // Adjust the import path as needed

class ReadPage extends StatefulWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  List<dynamic> users = []; // To store user data

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Fetch users when the widget is initialized
  }

  Future<void> fetchUsers() async {
    var fetchedUsers = await Api.fetchUsers(); // Use the fetch method from Api
    setState(() {
      users = fetchedUsers; // Update state with fetched users
    });
  }

  Future<void> updateUser(String id) async {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final addressController = TextEditingController();

    // Show dialog for updating user
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                // Prepare data for updating
                Map<String, String> updatedData = {
                  'name': nameController.text,
                  'age': ageController.text,
                  'address': addressController.text,
                };

                await Api.updateUser(id, updatedData);
                fetchUsers(); // Refresh the user list
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteUser(String id) async{
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete this user?"),
        actions: [TextButton(onPressed: (){
          Navigator.of(context).pop(); // Close the dialog without deleting
        }, child: const Text('Cancel')),
        TextButton(onPressed: () async {
          await Api.deleteUser(id);
          fetchUsers();
          Navigator.of(context).pop();
        }, child: const Text("Yes"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: DataTable
          (
            border: TableBorder.all(),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Age')),
              DataColumn(label: Text('Address')),
              DataColumn(label: Text('Actions')),
            ],
            rows: users.map<DataRow>((user) {
              return DataRow(cells: [
                DataCell(Text(user['idsampledata'].toString())), // ID
                DataCell(Text(user['name'])), // Name
                DataCell(Text(user['age'])), // Age
                DataCell(Text(user['address'])), // Address
                DataCell(Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      updateUser(user['idsampledata'].toString())
                      ;
                    }, icon: const Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      deleteUser(user['idsampledata'].toString());
                    }, icon: const Icon(Icons.delete)),
                  ],
                ))
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
