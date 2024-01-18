import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackees/configs/constants/assets_configs/assets_constants.dart';
import 'package:snackees/core/models/popular_items_model.dart';
import 'package:snackees/modules/home/model/category_model.dart';

final homeProvider =
    ChangeNotifierProvider<HomePageProvider>((ref) => HomePageProvider());

class HomePageProvider extends ChangeNotifier {
  bool isLocationShow = false;
  int selectedMovie = 0;
  int seletedTime = 0;
  int selectedCat = 0;
  void selectCategory(int val) {
    selectedCat = val;

    notifyListeners();
  }

  void selectMovie(int val) {
    selectedMovie = val;

    notifyListeners();
  }

  void selectTime(int val) {
    seletedTime = val;

    notifyListeners();
  }

  void showLocation(bool val) {
    isLocationShow = val;

    notifyListeners();
  }

  List<String> movieList = [
    'Sipder-man',
    'Badhaai Do',
    'Pushpa',
  ];

  List<String> timing = [
    '1:00 PM',
    '3:00 PM',
    '5:00 PM',
    '7:00 PM',
    '9:00 PM',
    '10:00 PM'
  ];
  List<CategoryModel> categoryList = [
    CategoryModel(title: 'Pizza', image: IconsString.ctg_pizza),
    CategoryModel(title: 'Burger', image: IconsString.ctg_burger),
    CategoryModel(title: 'Popcorn', image: IconsString.ctg_popcorn),
  ];

  final List<PopularItemModel> popularItems = [
    PopularItemModel(
      title: "Margherita Pizza",
      speciality: "Cheesy pizza",
      imgPath: "assets/images/pizza_picture.png",
      price: 1250,
      sizes: ["S", "M", "L"],
      quantity: 1,
      rating: 4.9,
      cal: 145,
      cookingTime: "30 Min",
      details:
          "The cheese is melted and just about completely forms a liquid with the tomato sauce at the time of serving. The taste is of bread, cheese and a tomato sauce made with ripes tomatoes. The main ingredients for the Pizza are basil, mozzarella cheese and red tomatoes.",
    ),
    PopularItemModel(
      title: "Hamburger",
      speciality: "Double patty",
      imgPath: ImagesString.ham_burger_image,
      price: 350,
      sizes: ["S", "M", "L"],
      quantity: 2,
      rating: 4.9,
      cal: 145,
      cookingTime: "30 Min",
      details:
          "The cheese is melted and just about completely forms a liquid with the tomato sauce at the time of serving. The taste is of bread, cheese and a tomato sauce made with ripes tomatoes. The main ingredients for the Pizza are basil, mozzarella cheese and red tomatoes.",
    ),
  ];
}
