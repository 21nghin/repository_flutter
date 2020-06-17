import 'package:flutter/material.dart';
import 'package:fluttercartshopping/commom/models/cart.dart';
import 'package:fluttercartshopping/commom/models/item/cart_item.dart';
import 'package:fluttercartshopping/commom/utils/is_dark.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  CartPage(this.cart);

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your cart'),
        ),
        body: cart.items.isEmpty ? Center(child: Text('is empty', style: Theme
            .of(context)
            .textTheme
            .display1,)) : ListView(
          children: cart.items.map((item) => ItemTile(item)).toList())
    );
  }

  Widget ItemTile(CartItem item) {
    return Container(
      color: item.product.color,
      child: ListTile(
        title: Text(item.product.name, style: TextStyle(
          color: isDark(item.product.color) ? Colors.white : Colors.black,),
        ),
        trailing: CircleAvatar(
          backgroundColor: const Color(0x33FFFFFF),
          child: Text(item.count.toString(),style: TextStyle(color: isDark(item.product.color) ? Colors.white : Colors.black,),),
        ),
      ),
    );
  }
}
