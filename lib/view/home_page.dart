import 'package:authentication_crud/helpers/colors.dart';
import 'package:authentication_crud/view/add_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  final CollectionReference student =
      FirebaseFirestore.instance.collection('student');

  void deleteStudent(docid) {
    student.doc(docid).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
      
        stream: student.orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot studentSnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 236, 233, 233),
                            blurRadius: 8,
                            spreadRadius: 10,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: appcolor,
                            radius: 30,
                            child: Text(studentSnap['profile'] ?? ''),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              studentSnap['name'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(studentSnap['age'].toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                 
                            IconButton(
                                onPressed: () {
                                   deleteStudent(studentSnap.id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 30,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 80),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ));
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Student'),
          backgroundColor: appcolor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
