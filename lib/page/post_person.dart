
import 'package:apitttttt/controller/person.dart';
import 'package:apitttttt/widget/cmpanettextfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Postuser extends StatefulWidget {
  final String? firstname;
  final String? lastname;
  final int? id;
  final String? age;
  const Postuser({
    Key? key,
    this.id,
    this.firstname,
    this.lastname,
    this.age,
  });
  @override
  State<Postuser> createState() => _PostuserState();
}
class _PostuserState extends State<Postuser> {
  final _Controller = Get.put(Proson());
  final firstname1 = TextEditingController();
  final lastname1 = TextEditingController();
  final age1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
        appBar: AppBar(
          title: const Text("Post User"),
          backgroundColor: Colors.indigo[900],
        ),
        body: 
        _Controller.isSubmitLoading.value?
        CircularProgressIndicator():
         SingleChildScrollView(
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 120, left: 30, right: 30),
                    child: Column(
                      children: [
                        Companenttextflie(
                            texthint: "First name",
                            controller: firstname1,
                            textinput: TextInputType.text,
                            icon: const Icon(Icons.person),
                            ),
                        const SizedBox(
                          height: 10,
                        ),
                        Companenttextflie(
                            texthint: "last name",
                            controller: lastname1,
                            textinput: TextInputType.text,
                            icon: const Icon(Icons.person)),
                        const SizedBox(
                          height: 10,
                        ),
                        Companenttextflie(
                            texthint: "Age",
                            controller: age1,
                            textinput: TextInputType.text,
                            icon: const Icon(Icons.timer)),
                        GestureDetector(
                          onTap: () {
                            _Controller.postPerson(firstname1.text,lastname1.text, age1.text);
                              lastname1.text = "";
                              firstname1.text = "";
                              age1.text = "";
                          },
                          child: Container(
                              margin: const EdgeInsets.only(top: 100),
                              width: 200,
                              height: 50,
                              decoration:
                                  BoxDecoration(color: Colors.indigo[800]),
                              child: const Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
     ) ),
        );
  }
}
