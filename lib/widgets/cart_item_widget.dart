import 'package:amazon_clone/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/widgets/product_information_widget.dart';
import 'package:amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/utils/color_themes.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;

  const CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductScreen(productModel: product)),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    product.url,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ProductInformationWidget(
                    productName: product.productName,
                    cost: product.cost,
                    sellerName: product.sellerName,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSimpleRoundedButton(
                onPressed: () async {
                  await CloudFirestoreClass().deleteProductFromCart(uid: product.uid);
                },
                text: 'Delete',
                fontSize: 12,
              ),
              CustomSimpleRoundedButton(
                onPressed: () {},
                text: 'Save for Later',
                fontSize: 12,
              ),
            ],
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'See more like this',
              style: TextStyle(color: activeCyanColor, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
