import '../models/categories_model.dart';
import '../models/deals_model.dart';

List<CategoriesModel> categories = [
  CategoriesModel(imageUrl: "assets/images/14.jpg", title: "Shoes"),
  CategoriesModel(imageUrl: "assets/images/product-8.jpg", title: "Watches"),
  CategoriesModel(imageUrl: "assets/images/buy-1.jpg", title: "T-shirts"),
  CategoriesModel(imageUrl: "assets/images/info.png", title: "Others"),
];

List<DealsModel> deals = [
  DealsModel(
    imageUrl: "assets/images/14.jpg", 
    name: "Black leather Shoe", 
    id: 1, 
    price: 200, 
    review: 3, 
    star: 4.6, 
    value: 1,
    category: "Shoes"
    ),
    DealsModel(
    imageUrl: "assets/images/buy-1.jpg", 
    name: "Red Puma T-shirt", 
    id: 2, 
    price: 20, 
    review: 3, 
    star: 4.6, 
    value: 1,
    category: "T-shirts"
    ),
    DealsModel(
    imageUrl: "assets/images/product-7.jpg", 
    name: "Socks", 
    id: 3, 
    price: 2, 
    review: 3, 
    star: 4.6, 
    value: 1,
    category: "Others"
    ),
    DealsModel(
    imageUrl: "assets/images/product-8.jpg", 
    name: "Black Watch", 
    id: 4, 
    price: 100, 
    review: 3, 
    star: 4.6, 
    value: 1,
    category: "Others"
    ),
    DealsModel(
    imageUrl: "assets/images/product-8.jpg", 
    name: "Black Watch", 
    id: 4, 
    price: 100, 
    review: 3, 
    star: 4.6, 
    value: 1,
    category: "Others"
    ),
    DealsModel(
    imageUrl: "assets/images/product-8.jpg", 
    name: "Black Watch", 
    id: 4, 
    price: 100, 
    review: 3, 
    star: 4.6, 
    value: 1,
    category: "Others"
    ),
    DealsModel(
    imageUrl: "assets/images/product-8.jpg", 
    name: "Black Watch", 
    id: 4, 
    price: 100, 
    review: 3, 
    star: 4.6, 
    value: 1,
    category: "Others"
    ),
    DealsModel(
    imageUrl: "assets/images/product-8.jpg", 
    name: "Black Watch", 
    id: 4, 
    price: 100, 
    review: 3, 
    star: 4.6, 
    value: 1,
    category: "Others"
    ),
];

List<DealsModel> itemsOnCart = [];
List<DealsModel> itemsOnSearch = [];
