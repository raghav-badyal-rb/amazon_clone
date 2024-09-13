import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;
  final double fontSize; // Added font size parameter
  const ProductInformationWidget({
    Key? key,
    required this.productName,
    required this.cost,
    required this.sellerName,
    this.fontSize = 16, // Default value for font size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productName,
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize, // Used the passed font size
                letterSpacing: 0.9,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: CostWidget(color: Colors.black, cost: cost),
            ),
          ),
          const SizedBox(height: 7),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Sold by ",
                      style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                  TextSpan(
                      text: sellerName,
                      style: const TextStyle(
                          color: activeCyanColor, fontSize: 14)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
