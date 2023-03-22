import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/home_provider.dart';
import 'package:provider_practice/screen/base_widget/custom_app_bar.dart';
import 'package:provider_practice/screen/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override

  void didChangeDependencies()async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
   await Provider.of<HomeProvider>(context, listen: false).getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            title: "Home Screen",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            icon: Icons.shopping_cart,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Text("Data"),
          Consumer<HomeProvider>(builder: (context, homeProvider, child) {
            print(homeProvider.userModelList);
            return homeProvider.isLoading ? Center(child: CircularProgressIndicator(),):homeProvider.userModelList.isNotEmpty  ? ListView.builder(
                itemCount: homeProvider.userModelList.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, int index) => ListTile(
                  title: Text("${index+1} ."+homeProvider.userModelList[index].title),
                )): Center(child: Text("NO data"),);
          })
    ],),
        ));
}}
