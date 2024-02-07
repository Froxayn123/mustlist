import 'package:flutter/material.dart';
import 'package:mustlist/main_screen.dart';
import 'package:mustlist/model/assignments_list.dart';

class AddAssignmentScreen extends StatefulWidget {
  const AddAssignmentScreen({Key? key}) : super(key: key);

  @override
  State<AddAssignmentScreen> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignmentScreen> {
  TextEditingController textControllerName = TextEditingController();
  TextEditingController textControllerDesc = TextEditingController();
  void addAssign() {
    final String inputName = textControllerName.text;
    final String inputDesc = textControllerDesc.text;

    if (inputName.isNotEmpty && inputDesc.isNotEmpty) {
      setState(() {
        assignmentList.add(Assignment(name: inputName, description: inputDesc));
      });
    }

    textControllerName.clear();
    textControllerDesc.clear();
  }

  String valueName = '';
  String valueDesc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MustList'),
          backgroundColor: Colors.cyan[500],
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: textControllerName,
                minLines: 1,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "Masukkan Judul Tugas",
                  labelText: "Tugas",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextFormField(
                controller: textControllerDesc,
                minLines: 1,
                maxLines: 5,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "Masukkan Deskripsi Tugas",
                  labelText: "Deskripsi",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Simpan'),
                onPressed: () {
                  addAssign();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MainScreen();
                  }));
                },
              ),
            ],
          ),
        ));
  }
}
