import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/response/status.dart';
import 'package:flutter_mvvm/model/product_model.dart';
import 'package:flutter_mvvm/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewviewModel homeViewviewModel = HomeViewviewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewviewModel.fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home")),
      body: ChangeNotifierProvider<HomeViewviewModel>(
          create: (BuildContext context) => homeViewviewModel,
          child: Consumer<HomeViewviewModel>(
            builder: (context, value, _) {
              switch (value.productList.status) {
                case Status.LOADING:
                  return CircularProgressIndicator();
                case Status.ERROR:
                  return Text(value.productList.message.toString());
                case Status.COMPLETED:
                  return CircleAvatar();
              }
              return Container(
                child: Text("amds"),
              );
            },
          )),
    );
  }
}
