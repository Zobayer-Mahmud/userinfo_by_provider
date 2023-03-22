import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({Key? key, required this.title, this.onPressed,this.centerTitle =true,this.icon }) : super(key: key);
String title;
   Function()? onPressed;
   IconData? icon;
   bool? centerTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title),
      centerTitle:centerTitle,
      automaticallyImplyLeading: !centerTitle!,
      actions: [


       onPressed!=null? IconButton(onPressed: onPressed, icon: Icon(icon)):const SizedBox.shrink()],);
  }
}
