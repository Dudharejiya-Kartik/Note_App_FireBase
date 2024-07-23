import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app_firebase/model/note_model.dart';

import '../../services/firestore_service.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                  FireStoreService.instance.currentUser!.photoURL,
                ),
              ),
              accountName:
                  Text(FireStoreService.instance.currentUser!.displayName),
              accountEmail: Text(FireStoreService.instance.currentUser!.email),
            ),
            ListTile(
              leading: const Icon(Icons.note),
              title: const Text("My Notes"),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('notes');
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController titleController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add Note'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('allNotes').add(
                          notemodel(
                            title: titleController.text,
                            content: descriptionController.text,
                          ).toMap,
                        );

                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
