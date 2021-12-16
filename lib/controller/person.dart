import 'dart:convert';
import 'dart:ffi';

import 'package:apitttttt/model/person.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Proson extends GetxController {
  var userModel = Data().obs;
  var userList = <Data>[].obs;
  final islosding = false.obs;
  late final isSubmitLoading = false.obs;

  Future getPerson() async {
    try {
      String url = "https://peopleinfoapi.herokuapp.com/api/person";
      await http.get(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) {
          var resposJson = jsonDecode(response.body)["data"];
         resposJson.map((json) {
           userModel.value = Data.fromJson(json);
            userList.add(userModel.value);
          }).toList();
         print("=============" + userList.length.toString());
        // userList=resposJson;
         print(userList[0].id.toString());

        }
      });
    } catch (e) {
      print(e.toString());
    } 
  }
  Future <void> postPerson(String firstname ,String lastname ,String age)async{
    isSubmitLoading(false);
    try{

        String url = "https://peopleinfoapi.herokuapp.com/api/person";
        await http.post(Uri.parse(url),body: {
          "first_name":firstname,
          "last_name":lastname,
          "age":age,
          "active_date":"111111"
        }).then((value){
            print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"+value.statusCode.toString());
        });
    }catch(e){
      print(e.toString());
    }
    finally{
       isSubmitLoading(true);
    }
  }
  Future deleteuser(String id) async{
     isSubmitLoading(false);
    try {
      String url = "https://peopleinfoapi.herokuapp.com/api/person/$id";
      await http.delete(Uri.parse(url), body: {
      "id":id
      }).then((value) {
        print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr" +
            value.statusCode.toString());
      });
    } catch (e) {
      print(e.toString());
    } finally {
      isSubmitLoading(true);
    }
  }
}
