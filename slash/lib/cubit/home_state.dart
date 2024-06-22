import 'package:equatable/equatable.dart';
import 'package:slash/models/product.dart';
import 'package:slash/models/category.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> bestSelling;
  final List<Product> newArrival;
  final List<Product> recommendedForYou;
  final List<Category> categories;
  final String selectedCountry;

  const HomeLoaded({
    required this.bestSelling,
    required this.newArrival,
    required this.recommendedForYou,
    this.categories = const [],
    this.selectedCountry = '',
  });

  @override
  List<Object> get props => [bestSelling, newArrival, recommendedForYou, categories, selectedCountry];

  HomeLoaded copyWith({
    List<Product>? bestSelling,
    List<Product>? newArrival,
    List<Product>? recommendedForYou,
    List<Category>? categories,
    String? selectedCountry,
  }) {
    return HomeLoaded(
      bestSelling: bestSelling ?? this.bestSelling,
      newArrival: newArrival ?? this.newArrival,
      recommendedForYou: recommendedForYou ?? this.recommendedForYou,
      categories: categories ?? this.categories,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }
}
