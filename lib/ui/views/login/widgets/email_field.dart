import "package:flutter/material.dart";

class EmailFiled extends StatelessWidget {
  final TextEditingController controller;

  const EmailFiled({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    /* 
      BuildContext represents the location of this widget in the widget tree. 
      Even if you don't use it, Flutter needs it ready in case you want to:
      Call Theme.of(context) to access theme data,
      Use MediaQuery.of(context) to get screen size,
      Navigate using Navigator.of(context).push(...),
      Or refer to inherited widgets higher in the tree.
     */

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) return "Please, enter your email";
        if (!value.contains('@')) return "Please, enter a valid email";
        return null;
      },
    );
  }
}
