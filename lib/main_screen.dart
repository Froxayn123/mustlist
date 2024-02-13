import 'package:flutter/material.dart';
import 'package:mustlist/add_screen.dart';
import 'package:mustlist/model/assignments_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainState();
}

class _MainState extends State<MainScreen> {
  Assignment? assignment;

  void deleteAssign() {
    setState(() {
      assignmentList.removeAt(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('MustList'),
            backgroundColor: Colors.cyan[500],
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final assignment = assignmentList[index];
                return Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Mata Kuliah : ${assignment.name} ',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                assignment.description,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        child: const Icon(Icons.delete),
                        onPressed: () {
                          deleteAssign();
                        },
                      ),
                    ],
                  ),
                );
              },
              itemCount: assignmentList.length,
            ),
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddAssignmentScreen();
              }));
            },
            child: const Icon(Icons.add),
          ), //
        );
      },
    );
  }
}
