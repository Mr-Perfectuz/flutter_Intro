import 'package:flutter/material.dart';

import 'data/data.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Onboarding",
      home:Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<SliderModel> slides = new List<SliderModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(itemBuilder: null,),
    );
  }
}

class SliderTitle extends StatelessWidget {

  String imageAssetPart, title, description;
  SliderTitle({this.imageAssetPart, this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(imageAssetPart),
          SizedBox(height: 20,),
          Text(title),
          SizedBox(height: 12,),
          Text(description)

        ],
      )
    );
  }
}

