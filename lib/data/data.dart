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
  sliderModel.setTitle("");
  sliderModel.setDescription("Mavqut мобил иловасига хуш келибсиз");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/img2.png");
  sliderModel.setTitle("");
  sliderModel.setDescription("Ушбу илова сизга намоз ва рўза ибодатларининг қазоларини аниқ ҳисоблаш ва тўкис адо этиш имкониятини тақдим этади.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/img3.png");
  sliderModel.setTitle("");
  sliderModel.setDescription("Барча ёшдаги мўмин ва муслималарнинг фарзларини тўлиқ бажаришларида Мавқут намоз ва рўза  қазоларинининг миқдори, тахминий тугатилиш вақти ва жорий статистик маълумотлар билан таъминлайди.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setImageAssetPath("assets/img4.png");
  sliderModel.setTitle("");
  sliderModel.setDescription("Мусулмон аҳли фарзларимизни мукаммал адо этайлик. Aллоҳ барчамизни илмимизни зиёда қилсин!");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;

}