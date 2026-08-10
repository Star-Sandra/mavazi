import 'package:flutter/material.dart';
import 'package:mavazi/models/cart_item.dart';



class CartCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;

  const CartCard({
    super.key,
    required this.cartItem,
    required this.incrementQuantity,
    required this.decrementQuantity,
  });

  @override
  Widget build (BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Image.network(cartItem.product.imageUrl, width: 150, height: 150),
            SizedBox(width: 16),
            Expanded(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.product.name),
                  SizedBox(height: 8),
                  Text('KES ${cartItem.itemTotal}'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: decrementQuantity,
                        icon: Icon(Icons.remove),
                      ),
                      Text(cartItem.quantity.toString()),
                      IconButton(
                        onPressed: incrementQuantity,
                        icon: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     child: Padding(
  //       padding: EdgeInsets.all(8),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(productName),
  //           Text('KES $productPrice'),
  //           Text('Qty: $quantity'),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}