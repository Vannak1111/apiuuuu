import 'package:apitttttt/controller/person.dart';
import 'package:apitttttt/page/post_person.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _Controller = Get.put(Proson());
  @override
  void initState() {
    super.initState();
    _Controller.getPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[800],
          title: const Text("API Test"),
        ),
        body: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: _Controller.userList
                        .map(
                          (user) => Container(
                            height: 90,
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.indigo[100],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  height: 90,
                                  width: 90,
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          user.id.toString(),
                                          style: TextStyle(
                                              color: Colors.indigo[900]),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: const Icon(
                                          Icons.person_pin_sharp,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                    
                                    ],
                                  ),
                                ),
                                
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  height: 90,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.firstName.toString() +
                                            " " +
                                            user.lastName.toString(),
                                        style: TextStyle(
                                            color: Colors.indigo[900]),
                                      ),
                                      const Spacer(),
                                      Text(
                                          "Created_at : " +
                                              user.createdAt.toString(),
                                          style: TextStyle(
                                              color: Colors.indigo[900])),
                                      const Spacer(),
                                      Text(
                                          "Updated_at :" +
                                              user.updatedAt.toString(),
                                          style: TextStyle(
                                              color: Colors.indigo[900]))
                                    ],
                                  ),
                                ),
                                  Container(
                                 
                                    child: GestureDetector(
                                        onTap: () {
                                          print("dddddddddddddddddddddddddd");
                                          _Controller.deleteuser(user.id!.toString());
                                        },
                                        child: const Icon(Icons.delete)))
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const Postuser());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo[800],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  margin: const EdgeInsets.only(
                      top: 660, bottom: 10, left: 30, right: 30),
                  child: const Center(
                    child: Text(
                      "Post User",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
