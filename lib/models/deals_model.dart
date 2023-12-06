class DealsModel {
  final int id;
  final String imageUrl;
  final String name;
  final double price;
  final double review;
  final double star;
  final String category;
  int value;

  DealsModel(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.review,
      required this.star,
      required this.category,
      required this.value});
}
