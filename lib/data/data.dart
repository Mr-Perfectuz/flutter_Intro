import 'dart:ffi';

import 'package:flutter/material.dart';

class SliderModel{
  String imagePath;
  String title;
  String description;

  SliderModel({this.imagePath, this.title, this.description});

  void setImageAssetPath(String getImagepath) {
    imagePath = getImagepath;

  }

  void setTitle(String getTitle) {
    title = getTitle;

  }

  void setDescription(String getDescripption) {
    description = getDescripption;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDescription(){
    return description;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1

  sliderModel.setImageAssetPath("assets/img1.png");
  sliderModel.setTitle("")
}