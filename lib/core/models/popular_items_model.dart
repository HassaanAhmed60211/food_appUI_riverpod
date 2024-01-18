class PopularItemModel {
  final String title;
  final String speciality;
  final int price;
  final List<String> sizes;
  final int quantity;
  final num rating;
  final int cal;
  final String cookingTime;
  final String details;
  final String imgPath;
  PopularItemModel(
      {required this.title,
      required this.speciality,
      required this.price,
      required this.sizes,
      required this.imgPath,
      required this.quantity,
      required this.rating,
      required this.cal,
      required this.cookingTime,
      required this.details});
}

class PopularSingleItem {
  final String title;
  final String speciality;
  double price;
  final String sizes;
  int quantity;
  final num rating;
  final int cal;
  final String cookingTime;
  final String details;
  final String imgPath;
  PopularSingleItem(
      {required this.title,
      required this.speciality,
      required this.price,
      required this.sizes,
      required this.imgPath,
      required this.quantity,
      required this.rating,
      required this.cal,
      required this.cookingTime,
      required this.details});
}
