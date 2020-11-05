
import 'dart:io';
import 'dart:ui';

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
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  // Slider Icon
  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 20.0 : 10.0,
      width: isCurrentPage ? 20.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ?  Colors.purple : Colors.purpleAccent,
        borderRadius: BorderRadius.circular(12)

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        // controller for next and skipp buttons
        controller: pageController,
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
        color: Colors.white,
        height: Platform.isWindows ? 70 : 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // this make the button clickable
            InkWell(
              onTap: (){
                // make the button jump to the previous page
                pageController.animateToPage(currentIndex - 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
                child: Container(
                    child: Text("Орқага"))
            ),
            Row(
              children: <Widget>[
                for(int i=0; i<slides.length; i++) currentIndex == i ?pageIndexIndicator(true) :pageIndexIndicator(false)

              ],
            ),
            InkWell(
                onTap: (){
                  // make the button jump to the nex page
                  pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Container(
                    child: Text("Олдинга"))

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
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetPart),
          SizedBox(height: 20,),
          Text(title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w200,
          ),),
          SizedBox(height: 12,),
          Container(
              child: Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),)),


        ],
      )
    );
  }
}

