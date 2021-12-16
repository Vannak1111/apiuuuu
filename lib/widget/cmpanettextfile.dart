import 'package:flutter/material.dart';

// ignore: camel_case_types
class Companenttextflie extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final Icon? icon;
  final String? texthint;
  final TextInputType? textinput;
  final TextEditingController? controller;
  const Companenttextflie(
      {Key? key,
      this.texthint,
      @required this.textinput,
      this.controller,
      this.icon});
  @override
  _CompanenttextflieState createState() => _CompanenttextflieState();
}

class _CompanenttextflieState extends State<Companenttextflie> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.indigo[900],
      controller: widget.controller!,
      style: TextStyle(color: Colors.indigo[800]),
      textInputAction: TextInputAction.search,
      keyboardType: widget.textinput,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: widget.icon,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintTextDirection: TextDirection.ltr,
        hintText: widget.texthint!,
      ),
    );
  }
}
