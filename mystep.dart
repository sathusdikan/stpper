import 'package:flutter/material.dart';

class Mystep extends StatefulWidget {
  const Mystep({super.key});

  @override
  State<Mystep> createState() => _MystepState();
}

class _MystepState extends State<Mystep> {
  int step1 = 0;
  bool val = false;
  TextEditingController mycontroller = TextEditingController();
  TextEditingController mycontroller1 = TextEditingController();
  List<TextEditingController> mycontrollerlist1 = [];

  TextEditingController mycontroller2 = TextEditingController();
  TextEditingController mycontroller3 = TextEditingController();
  TextEditingController mycontroller4 = TextEditingController();
  List<TextEditingController> mycontrollerlist2 = [];

  @override
  void initState() {
    mycontrollerlist1 = [mycontroller, mycontroller1];
    mycontrollerlist2 = [mycontroller2, mycontroller3, mycontroller4];
    super.initState();
  }

  void continu() {
    if (step1 == 1) {
      if (mycontrollerlist2[0].text.isEmpty ||
          mycontrollerlist2[1].text.isEmpty ||
          mycontrollerlist2[2].text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                "you missed to fill some thing,plese go and check    ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              title: Row(
                children: [
                  Icon(
                    Icons.cancel,
                    size: 35,
                    color: Colors.red,
                  ),
                  Text(
                    "Alert!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  )
                ],
              ),
            );
          },
        );
      } else if (step1 < 3) {
        setState(() {
          step1 = step1 + 1;
        });
      }
    }

    if (step1 == 0) {
      if (mycontrollerlist1[0].text.isEmpty ||
          mycontrollerlist1[1].text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                "you missed to fill some thing,plese go and check    ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              title: Row(
                children: [
                  Icon(
                    Icons.cancel,
                    size: 50,
                    color: Colors.red,
                  ),
                  Text(
                    "Alert!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  )
                ],
              ),
            );
          },
        );
      } else if (step1 < 3) {
        setState(() {
          step1 = step1 + 1;
        });
      }
    }
    if (step1 == 2) {
      if (val == true) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  "your register is success    ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                title: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 35,
                      color: Colors.green,
                    ),
                    Text(
                      "success!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    )
                  ],
                ),
              );
            });
      }
    }
  }

  List<Step> mysteplist() => [
        Step(
            isActive: step1 >= 0,
            title: Text("About user"),
            content: Column(
              children: [
                TextField(
                  controller: mycontroller,
                  decoration: InputDecoration(
                      labelText: "First name", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: mycontroller1,
                  decoration: InputDecoration(
                      labelText: "Last name", border: OutlineInputBorder()),
                )
              ],
            )),
        Step(
            isActive: step1 >= 1,
            title: Text("Address"),
            content: Column(
              children: [
                TextField(
                  controller: mycontroller2,
                  decoration: InputDecoration(
                      labelText: "City", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: mycontroller3,
                  decoration: InputDecoration(
                      labelText: "home number", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: mycontroller4,
                  decoration: InputDecoration(
                      labelText: "Mobile number", border: OutlineInputBorder()),
                ),
              ],
            )),
        Step(
            isActive: step1 >= 2,
            title: Text("Conform"),
            content: Column(
              children: [
                Container(
                  color: Colors.deepPurple[100],
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("first name is :" + mycontroller.text),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text("Last name is :" + mycontroller1.text),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text("City is :" + mycontroller2.text),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text("home number is :" + mycontroller3.text),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text("mobile number is :" + mycontroller4.text),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                CheckboxListTile(
                  tileColor: Colors.red[100],
                  title: Text("plese conform your register :"),
                  value: val,
                  onChanged: (value) {
                    setState(() {
                      val = !val;
                    });
                  },
                )
              ],
            ))
      ];
  void cancle() {
    if (step1 > 0) {
      setState(() {
        step1 = step1 - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        toolbarHeight: 120,
        backgroundColor: Colors.deepPurple[100],
        elevation: 10,
      ),
      body: Stepper(
        currentStep: step1,
        steps: mysteplist(),
        type: StepperType.horizontal,
        elevation: 2,
        onStepContinue: continu,
        onStepCancel: cancle,
      ),
    );
  }
}
