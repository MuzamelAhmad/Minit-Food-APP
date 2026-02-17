import 'package:flutter/material.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/ProductDetailsPage/components/Tiles/add_to_cart_sheet.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/ProductDetailsPage/product_details_page.dart';

class CartPage extends StatefulWidget {
  final int index;
  final List foodData;
  const CartPage({super.key, required this.index, required this.foodData});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: SizedBox.shrink(),
          bottomSheet: SizedBox(
            child: Stack(
              children: [
                ProductDetailsPage(
                  index: widget.index,
                  foodData: widget.foodData,
                ),
                AddToCartSheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
