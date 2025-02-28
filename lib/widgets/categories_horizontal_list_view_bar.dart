import 'package:amazon_clone/screens/results_screen.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoriesHorizontalListViewBar extends StatelessWidget {
  const CategoriesHorizontalListViewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsScreen(
                    query: categoriesList[index],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      categoryLogos[index],
                    ),
                    radius: 20, // Adjust the radius as needed
                  ),
                  SizedBox(height: 5), // Adjust the spacing as needed
                  Text(
                    categoriesList[index],
                    style: TextStyle(fontSize: 12), // Adjust the font size as needed
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
