import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCovid {
  String? title;
  String? subtitle;
  String? description;
  String? image;
  Color? color;
  
 
  CardCovid({this.title, this.subtitle,this.description,this.image,this.color});
  factory CardCovid.fromJson(Map<String, dynamic> json) {
    return CardCovid(
      title: json["title"],
      subtitle: json["subtitle"],
      description: json['description'],
      image: json['Image'],
      color:json["color"]
    );
  }
}


