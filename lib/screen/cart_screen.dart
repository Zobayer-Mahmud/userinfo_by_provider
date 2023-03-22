import 'package:flutter/material.dart';
import 'package:provider_practice/screen/base_widget/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:const Size.fromHeight(60),
        child: CustomAppBar(title: "Cart Screen",
        ),

      ),
    );
  }
}
