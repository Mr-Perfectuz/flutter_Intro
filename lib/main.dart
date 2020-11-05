import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
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
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }
  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: slides.length,
          onPageChanged:(val){
          setState(() {
            currentIndex = val;
          });
          },
          itemBuilder: (context, index){
          return SliderTitle(
            imageAssetPart: slides[index].getImageAssetPath(),
            title: slides[index].getTitle(),
            description: slides[index].getDescription(),
          );
    }),
      bottomSheet: currentIndex != slides.length-1 ? Container(
        height: Platform.isIOS 70 : 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: (){},
                child: Text("SKIP")
            ),
            Row(
              children: <Widget>[
                for(int i=0; i<slides.length; i++) currentIndex == i ?pageIndexIndicator(true) :pageIndexIndicator(false)
              ],
            ),
            InkWell(
                onTap: (){},
                child: Text("SKIP")
            ),
          ],
        ),
    ) : Container(
        child: Text(""),

    )
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
        mainAxisAlignment: MainAxisAlignment.center,
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

