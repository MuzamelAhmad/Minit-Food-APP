import 'package:flutter/material.dart';

class FoodModel {
  final String foodName;
  final String foodDescription;
  final int foodPrice;
  final String resName;
  final String ownerName;
  final String location;
  final String rating;
  final String distance;
  final String foodImage;
  ValueNotifier<bool> isFavorite;

  FoodModel({
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
    required this.resName,
    required this.ownerName,
    required this.location,
    required this.rating,
    required this.distance,
    required this.foodImage,
    bool isFavorite = false,
  }) : this.isFavorite = ValueNotifier<bool>(isFavorite);
}
