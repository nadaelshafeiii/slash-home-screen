import 'package:flutter/material.dart';
import 'package:slash/models/category.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;
  final String title;

  CategoriesList({
    required this.categories,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15.0),
          height: 120, // Adjust the height as needed
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => SizedBox(width: 15),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black, // Set the background color of the icon
                    backgroundImage: AssetImage(categories[index].iconPath),
                  ),
                  SizedBox(height: 8),
                  Text(categories[index].name),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
