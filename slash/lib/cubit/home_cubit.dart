import 'package:bloc/bloc.dart';
import 'package:slash/cubit/home_state.dart';
import 'package:slash/models/product.dart';
import 'package:slash/models/category.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void loadHomeData() {
    // Dummy data loading
    emit(HomeLoaded(
      bestSelling: _dummyBestSelling,
      newArrival: _dummyNewArrival,
      recommendedForYou: _dummyRecommended,
      categories: _dummyCategories,
    ));
  }

  void selectCountry(String country) {
    if (state is HomeLoaded) {
      emit((state as HomeLoaded).copyWith(selectedCountry: country));
    }
  }

  // Dummy data
  final List<Product> _dummyBestSelling = [
    Product(id: 1, name: "Stitch Keychain", price: 55, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/stitchkeychain.jpg"),
    Product(id: 2, name: "Baby Girl Dress", price: 230, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/baby girl dress.jpg"),
    Product(id: 3, name: "Infant Hairband", price: 45, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/infant hairband.webp"),
    Product(id: 4, name: "Plush Toy", price: 120, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Plush Toy.jpg"),
    Product(id: 5, name: "Story Book", price: 90, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/story book.webp"),
  ];

  final List<Product> _dummyNewArrival = [
    Product(id: 1, name: "Printed Bag", price: 180, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Printed Bag.avif"),
    Product(id: 2, name: "Notebook", price: 80, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Notebook.webp"),
    Product(id: 3, name: "Wooden Sculpture", price: 95, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Wooden Sculpture.jpg"),
    Product(id: 4, name: "Handcrafted Vase", price: 130, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Handcrafted Vase.jpg"),
    Product(id: 5, name: "Decorative Pillow", price: 150, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Decorative Pillow.jpg"),
  ];

  final List<Product> _dummyRecommended = [
    Product(id: 1, name: "Leather Jacket", price: 340, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Leather Jacket.webp"),
    Product(id: 2, name: "Dog Medal", price: 45, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Dog Model.jpg"),
    Product(id: 3, name: "Leather Bracelet", price: 95, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Leather Bracelet.jpg"),
    Product(id: 4, name: "Smartwatch", price: 250, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Smartwatch.webp"),
    Product(id: 5, name: "Wireless Earbuds", price: 300, image: "C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/Wireless Earbuds.jpg"),
  ];

  final List<Category> _dummyCategories = [
    Category(name: 'Fashion', iconPath: 'C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/books.png'),
    Category(name: 'Games', iconPath: 'C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/books.png'),
    Category(name: 'Accessories', iconPath: 'C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/books.png'),
    Category(name: 'Books', iconPath: 'C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/books.png'),
    Category(name: 'Art', iconPath: 'C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/books.png'),

  ];
}
