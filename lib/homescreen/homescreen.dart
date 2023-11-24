import 'package:flutter/material.dart';
import 'package:flutter_application_7/controller/todo_controller.dart';
import 'package:flutter_application_7/modelclass/model_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  TextEditingController namecontroller = TextEditingController();

  List<dynamic> mylist = [];
  bool value = false;

  var box = Hive.box<todomodel>("todobox");

  @override
  void initState() {
    mylist = box.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30),
                          TextFormField(
                            controller: namecontroller,
                            maxLines: 2,
                            decoration: InputDecoration(
                                hintText: "title",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(height: 35),
                          ElevatedButton(
                              onPressed: () {
                                Todolistcontroller()
                                    .addelementToBox(namecontroller.text);
                                setState(() {});
                              },
                              child: Text("save"))
                        ],
                      ),
                    ),
                  ));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
              height: 780,
              child: ListView.builder(
                itemCount: mylist.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(box.get(mylist[index])?.title.toString() ?? ''),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) => Container(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(height: 30),
                                                    TextFormField(
                                                      controller:
                                                          namecontroller,
                                                      maxLines: 2,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText: "title",
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.black))),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    SizedBox(height: 35),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          print(index);
                                                        },
                                                        child: Text("update"))
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                onPressed: () {
                                  box.delete(mylist[index]);
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.tealAccent,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
