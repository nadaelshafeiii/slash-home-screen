import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/cubit/home_cubit.dart';
import 'package:slash/cubit/home_state.dart';
import 'package:slash/widgets/custom_navigation_bar.dart';
import 'package:slash/widgets/categories_list.dart';
import 'package:slash/widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadHomeData(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text('Slash.', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(width: 50),
              const Icon(Icons.location_on, color: Colors.black),
              const SizedBox(width: 5),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoaded && state.selectedCountry.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.selectedCountry,
                          style: const TextStyle(color: Colors.black, fontSize: 12),
                        ),

                      ],
                    );
                  }
                  return const Text('Nasr city\n Cairo', style: TextStyle(color: Colors.black));
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return Container(
                            child: ListView(
                              children: _buildCountryList(context),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              const Spacer(),
              const Icon(Icons.notifications, color: Colors.black),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0), // Adjust padding here
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0), // Adjust padding here
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search here..',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Icon(Icons.filter_list),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200, // Adjust the height as needed
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        children: [
                          Image.asset('C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/salejpg.jpg'),
                          Image.asset('C:/Users/fikry/OneDrive/Desktop/flutter/slash/lib/assets/images/salejpg.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(height: 8), // Add space between images and indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 2; i++) // Change 2 to the total number of images
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Container(
                              width: i == _currentIndex ? 14 : 10, // Adjust the width of each indicator
                              height: i == _currentIndex ? 14 : 10, // Adjust the height of each indicator
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: i == _currentIndex ? Colors.blue : Colors.grey, // Set the color of the indicator
                              ),
                            ),
                          ),
                      ],
                    ),
                    CategoriesList(
                      categories: state.categories,
                      title: 'Categories',
                    ),
                    ProductList(
                      title: 'Best Selling',
                      products: state.bestSelling,
                    ),
                    ProductList(
                      title: 'New Arrivals',
                      products: state.newArrival,
                    ),
                    ProductList(
                      title: 'Recommended for You',
                      products: state.recommendedForYou,
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {},
        ),
      ),
    );
  }

  List<Widget> _buildCountryList(BuildContext context) {
    final countries = ['USA', 'Canada', 'UK', 'Australia'];

    return countries.map((country) {
      return ListTile(
        title: Text(country),
        onTap: () {
          context.read<HomeCubit>().selectCountry(country);
          Navigator.pop(context);
        },
      );
    }).toList();
  }
}
